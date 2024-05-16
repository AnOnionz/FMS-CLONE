import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/history_exchange_module.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class HistoryExchangeSimplifyItem extends StatefulWidget {
  final OrderEntity order;
  final EmbeddedFeatureEntity feature;
  const HistoryExchangeSimplifyItem(
      {super.key, required this.order, required this.feature});

  @override
  State<HistoryExchangeSimplifyItem> createState() =>
      _HistoryExchangeSimplifyItemState();
}

class _HistoryExchangeSimplifyItemState
    extends State<HistoryExchangeSimplifyItem> {
  late final Map<FeatureCustomer, CustomerInfo> _identityField = {};

  late final featureExchange = widget.feature.feature;

  @override
  void initState() {
    final identities = featureExchange.featureCustomers
        ?.where((element) => element.isIdentity!);
    identities?.forEach((featureCustomer) {
      final customerInfo = widget.order.customerInfos!.firstWhereOrNull(
          (element) => element.featureCustomerId == featureCustomer.id);
      if (customerInfo != null) {
        _identityField[featureCustomer] = customerInfo;
      } else {
        _identityField[featureCustomer] =
            CustomerInfo(featureCustomerId: featureCustomer.id, value: '');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in _identityField.entries)
            Row(
              children: [
                Text(
                  '${item.key.name}: ',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                ),
                Text(
                  '${item.value.value}',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.black),
                )
              ],
            ),
          Row(
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
    );
  }
}
