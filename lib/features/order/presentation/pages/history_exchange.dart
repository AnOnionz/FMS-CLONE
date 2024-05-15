import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/date_picker.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../widgets/history/history_exchange_simplify_item.dart';

class HistoryExchangePage extends StatelessWidget {
  final FeatureEntity feature;
  const HistoryExchangePage({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    final List<OrderEntity> orders = [];
    return Scaffold(
      appBar: DefaultAppBar(title: 'Lịch sử đơn hàng'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 8.h),
            child: DatePicker(
              fillColor: AppColors.aliceBlue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              physics: kPhysics,
              itemBuilder: (context, index) => HistoryExchangeSimplifyItem(
                  order: orders[index], feature: feature),
            ),
          )
        ],
      ),
    );
  }
}
