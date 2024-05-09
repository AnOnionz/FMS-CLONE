import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../presentation/widgets/receive/gift_quantity_widget.dart';

final class ExchangeController {
  final FeatureEntity feature;
  final OrderEntity order;

  ExchangeController({required this.order, required this.feature});

  int priceExchanged = 0;

  late List<PurchaseEntity> purchases = order.purchases ?? <PurchaseEntity>[];

  late List<(OrderProduct product, int quantity)?> products =
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
}

class ExchangeItem {
  final FeatureScheme featureScheme;
  final bool isEnable;

  ExchangeItem({required this.featureScheme, required this.isEnable});
}
