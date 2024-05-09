import 'package:flutter/material.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../home/domain/entities/general_item_data.dart';

class DataFeature extends InheritedWidget {
  const DataFeature({
    super.key,
    required this.data,
    required this.order,
    required super.child,
  });

  final GeneralFeatureData data;
  final OrderEntity order;

  static DataFeature? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataFeature>();
  }

  static DataFeature of(BuildContext context) {
    final DataFeature? result = maybeOf(context);
    assert(result != null, 'No GeneralFeature found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DataFeature oldWidget) => data != oldWidget.data;
}
