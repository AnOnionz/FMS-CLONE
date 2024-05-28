import 'dart:core';

import 'package:collection/collection.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../core/mixins/common.dart';

final class ExchangeController {
  final FeatureEntity feature;
  final OrderEntity order;

  ExchangeController({required this.order, required this.feature});

  /// purchases form order
  List<PurchaseEntity> get purchases =>
      List<PurchaseEntity>.from(order.purchases ?? <PurchaseEntity>[]);

  /// product purchased
  List<(OrderProduct product, int quantity)?> get products =>
      feature.featureOrder!.products!.map((product) {
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

  /// purchases available
  List<PurchaseEntity> get purchasesAvailable => purchases.map((purchase) {
        final orderProduct = products
            .firstWhere((p) => p!.$1.id == purchase.featureOrderProductId);
        final productQuantityExchanged = productsExchanged[(
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

  List<(OrderProduct product, int quantity)?> get productsAvailable =>
      feature.featureOrder!.products!.map((product) {
        final PurchaseEntity? purchase = purchasesAvailable
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

  /// order total price
  int get price => order.totalPrice(feature.featureOrder!.products!);

  /// price exchanged
  int get priceExchanged => _exchanges.fold(0,
      (previousValue, element) => previousValue + (element.reachAmount ?? 0));

  /// products Exchanged
  Map<(int productId, int packageId), int> get productsExchanged => _exchanges
      .map((e) => e.exchangeConditions!)
      .expand((element) => element)
      .groupFoldBy(
          (element) => (element.product!.id!, element.productPackaging!.id!),
          (previous, element) => (previous ?? 0) + element.quantity!);

  /// scheme Exchanged
  List<Exchange> _exchanges = [];

  List<Exchange> get exchanges => _exchanges;

  void addExchange(Exchange exchange) {
    _exchanges.add(exchange);
  }

  void removeExchange(Exchange exchange) {
    _exchanges.remove(exchange);
  }

  bool isValid(Exchange exchange, int value) {
    if (exchange.reachAmount != null &&
        price - (value > 0 ? 0 : priceExchanged) < exchange.reachAmount!) {
      return false;
    }

    if (exchange.exchangeConditions!.isNotEmpty) {
      final orderProductQuantity = <int, int>{};
      final isValids = <bool>[];

      for (final ExchangeCondition condition in exchange.exchangeConditions!) {
        final purchase = productsAvailable.firstWhereOrNull(
            (product) => meetProduct(product: product!, condition: condition));

        if (purchase != null) {
          final quantityUsed = switch (
              orderProductQuantity[purchase.$1.id!] != null) {
            true => orderProductQuantity[purchase.$1.id!]!,
            false => 0
          };

          if (purchase.$2 - quantityUsed - condition.quantity! >= 0) {
            isValids.add(true);
          } else {
            isValids.add(false);
          }
          orderProductQuantity[purchase.$1.id!] =
              quantityUsed + condition.quantity!;
        } else {
          isValids.add(false);
        }
      }

      switch (exchange.logical) {
        case 'and':
          if (isValids.any((value) => value == false)) return false;
        case 'or':
          if (isValids.every((value) => value == false)) return false;
      }
    }

    return true;
  }

  bool meetProduct(
      {required (OrderProduct, int) product,
      required ExchangeCondition condition}) {
    final result = product.$1.product!.id == condition.product!.id &&
        product.$1.productPackaging!.id == condition.productPackaging!.id &&
        product.$2 >= condition.quantity!;
    return result;
  }
}
