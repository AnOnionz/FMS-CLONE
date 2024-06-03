import 'dart:core';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

final class ExchangeController {
  final FeatureEntity feature;
  final OrderEntity order;

  ExchangeController({required this.order, required this.feature});

  /// purchases form order
  List<PurchaseEntity> get _purchases =>
      List<PurchaseEntity>.from(order.purchases ?? <PurchaseEntity>[]);

  /// product purchased
  List<(OrderProduct product, int quantity)?> get _purchasesWithQuantity =>
      _orderProductsByQuantity(_purchases);

  /// purchases available
  List<PurchaseEntity> get _purchasesUnExchanged => _purchasesUnused();

  List<(OrderProduct product, int quantity)?>
      get _purchaseUnExchangedWithQuantity =>
          _orderProductsByQuantity(_purchasesUnExchanged);

  /// order total price
  int get _price => order.totalPrice(feature.featureOrder!.products!);

  /// price exchanged
  int get _priceExchanged => _exchanges.fold(0, priceExchanged);

  /// products Exchanged
  Map<(int productId, int packageId), int> get _productsExchanged => _exchanges
      .map((e) => e.exchangeConditions!)
      .expand((element) => element)
      .groupFoldBy(
          (element) => (element.product!.id!, element.productPackaging!.id!),
          (previous, element) => (previous ?? 0) + element.quantity!);

  /// Exchanged Condition
  List<Exchange> _exchanges = [];

  void addExchange(Exchange exchange) {
    Fx.log(exchange);
    _exchanges.add(_exchanged(exchange));
  }

  void removeExchange(Exchange exchange) {
    final e =
        _exchanges.lastWhereOrNull((element) => exchange.id == element.id);
    if (e != null) _exchanges.remove(e);
  }

  bool isValid(Exchange exchange, int value) {
    if (_isMaxQuantity(exchange, value)) return false;

    if (_isUnderAmount(exchange, value)) return false;

    if (exchange.exchangeConditions!.isNotEmpty) {
      if (exchange.logical == 'or') {
        final or = _or(exchange);
        return _isExpectedPrice(or);
      }

      if (exchange.logical == 'and') {
        final and = _and(exchange);
        return _isExpectedPrice(and);
      }
    }

    return true;
  }

  bool _productMatchCondition(
      {required (OrderProduct, int) product,
      required ExchangeCondition condition}) {
    final result = product.$1.product!.id == condition.product!.id &&
        product.$1.productPackaging!.id == condition.productPackaging!.id &&
        product.$2 >= condition.quantity!;
    return result;
  }

  bool _isExpectedPrice(
      ({List<(OrderProduct, int)?> purchases, bool success}) data) {
    if (!data.success) {
      return false;
    }
    final _priceExpected = data.purchases
        .fold(0, (previousValue, element) => element!.$2 * element.$1.price!);

    return _price - _priceExchanged - _priceExpected >= 0;
  }

  bool _isMaxQuantity(Exchange exchange, int value) {
    return exchange.maxReceiveQuantity != null &&
        value == exchange.maxReceiveQuantity;
  }

  bool _isUnderAmount(Exchange exchange, int value) {
    return exchange.reachAmount != null &&
        _price - _priceExchanged < exchange.reachAmount!;
  }

  ({bool success, List<(OrderProduct, int)?> purchases}) _and(
      Exchange exchange) {
    final quantities = <OrderProduct, int>{};
    final isValids = <bool>[];

    for (final ExchangeCondition condition in exchange.exchangeConditions!) {
      final productPurchased =
          _purchaseUnExchangedWithQuantity.firstWhereOrNull((product) =>
              _productMatchCondition(product: product!, condition: condition));

      if (productPurchased != null) {
        final quantityUsed = switch (quantities[productPurchased.$1] != null) {
          true => quantities[productPurchased.$1]!,
          false => 0
        };

        if (productPurchased.$2 - quantityUsed - condition.quantity! >= 0) {
          isValids.add(true);
        } else {
          isValids.add(false);
        }
        quantities[productPurchased.$1] = quantityUsed + condition.quantity!;
      } else {
        isValids.add(false);
      }
    }
    if (isValids.any((value) => value == false))
      return (success: false, purchases: []);
    return (
      success: true,
      purchases: quantities.entries.map((e) => (e.key, e.value)).toList()
    );
  }

  ({bool success, List<(OrderProduct, int)?> purchases}) _or(
      Exchange exchange) {
    final _exchangeConditions = <ExchangeCondition>[];
    int quantity = exchange.exchangeConditions!.first.quantity!;

    exchange.exchangeConditions!.forEach((exchangeCondition) {
      final purchaseUnExchanged =
          _purchaseUnExchangedWithQuantity.firstWhereOrNull((element) =>
              element!.$1.product!.id == exchangeCondition.product!.id &&
              element.$1.productPackaging!.id ==
                  exchangeCondition.productPackaging!.id);

      if (purchaseUnExchanged != null && quantity > 0) {
        final purchaseQuantity =
            min(exchangeCondition.quantity!, purchaseUnExchanged.$2);

        quantity -= purchaseQuantity;
        _exchangeConditions
            .add(exchangeCondition.copyWith(quantity: purchaseQuantity));
      }
    });

    if (_exchangeConditions.fold(
            0, (previousValue, element) => previousValue + element.quantity!) !=
        exchange.exchangeConditions!.first.quantity!) {
      return (success: false, purchases: []);
    } else {
      return _and(exchange.copyWith(exchangeConditions: _exchangeConditions));
    }
  }

  List<(OrderProduct product, int quantity)?> _orderProductsByQuantity(
      List<PurchaseEntity> purchases) {
    return feature.featureOrder!.products!.map((product) {
      final PurchaseEntity? purchase = purchases
          .where((element) =>
              element.quantity! > 0 &&
              element.featureOrderProductId == product.id!)
          .firstOrNull;

      if (purchase != null) {
        return (product, purchase.quantity!);
      }
      return null;
    }).toList()
      ..removeWhere((data) => data == null);
  }

  List<PurchaseEntity> _purchasesUnused() {
    return _purchases.map((purchase) {
      final orderProduct = _purchasesWithQuantity
          .firstWhere((p) => p!.$1.id == purchase.featureOrderProductId);
      final productQuantityExchanged = _productsExchanged[(
        orderProduct!.$1.product!.id,
        orderProduct.$1.productPackaging!.id
      )];
      if (productQuantityExchanged != null) {
        return purchase.copyWith(
            id: purchase.id,
            featureOrderProductId: purchase.featureOrderProductId,
            quantity: purchase.quantity! - productQuantityExchanged);
      }
      return purchase;
    }).toList();
  }

  Exchange _exchanged(Exchange exchange) {
    if (exchange.exchangeConditions != null &&
        exchange.exchangeConditions!.isNotEmpty) {
      if (exchange.logical == 'and') {
        return exchange;
      }
      if (exchange.logical == 'or') {
        final _exchangeConditions = <ExchangeCondition>[];
        int quantity = exchange.exchangeConditions!.first.quantity!;

        exchange.exchangeConditions!.forEach((exchangeCondition) {
          final purchaseUnExchanged =
              _purchaseUnExchangedWithQuantity.firstWhereOrNull((element) =>
                  element!.$1.product!.id == exchangeCondition.product!.id &&
                  element.$1.productPackaging!.id ==
                      exchangeCondition.productPackaging!.id);

          if (purchaseUnExchanged != null && quantity > 0) {
            final purchaseQuantity =
                min(exchangeCondition.quantity!, purchaseUnExchanged.$2);

            quantity -= purchaseQuantity;
            _exchangeConditions
                .add(exchangeCondition.copyWith(quantity: purchaseQuantity));
          }
        });

        return exchange.copyWith(exchangeConditions: _exchangeConditions);
      }
    }

    return exchange;
  }

  int priceExchanged(int previousValue, Exchange exchange) {
    final exchangeConditionPrice = (exchange.exchangeConditions ?? []).fold(0,
        (previousValue, exchangeCondition) {
      final productPrice = feature.featureOrder!.products!
              .firstWhere((product) =>
                  product.product!.id == exchangeCondition.product!.id &&
                  product.productPackaging!.id ==
                      exchangeCondition.productPackaging!.id)
              .price ??
          0;
      return previousValue + productPrice * exchangeCondition.quantity!;
    });
    if (exchange.reachAmount != null) {
      return previousValue + exchange.reachAmount!;
    } else {
      return previousValue +
          (exchange.reachAmount ?? 0) +
          exchangeConditionPrice;
    }
  }
}
