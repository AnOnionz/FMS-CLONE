import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/order_module.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class HistoryExchangeSimplifyItem extends StatefulWidget {
  final OrderEntity order;
  final FeatureEntity feature;
  const HistoryExchangeSimplifyItem(
      {super.key, required this.order, required this.feature});

  @override
  State<HistoryExchangeSimplifyItem> createState() =>
      _HistoryExchangeSimplifyItemState();
}

class _HistoryExchangeSimplifyItemState
    extends State<HistoryExchangeSimplifyItem> {
  late final Map<FeatureCustomer, CustomerInfo> _identityField = {};

  @override
  void initState() {
    final identities = widget.feature.featureCustomers
        ?.where((element) => element.isIdentity!);
    identities?.forEach((featureCustomer) {
      final customerInfo = widget.order.customerInfos!.firstWhereOrNull(
          (element) => element.featureCustomerId == featureCustomer.id);
      if (customerInfo != null) {
        _identityField[featureCustomer] = customerInfo;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.nextRoute(OrderModule.historyDetail),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.sqr)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in _identityField.entries)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.key.name}: ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                  ),
                  Text(
                    '${item.value.value}',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.black),
                  )
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thời gian: ',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                ),
                Text(
                  widget.order.dataTimestamp.formatBy(khmdMy),
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.black),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trạng thái: ',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                ),
                Text(
                  widget.order.status.name,
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
