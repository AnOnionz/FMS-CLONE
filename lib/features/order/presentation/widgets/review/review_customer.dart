import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';
import '../../../domain/entities/order_entity.dart';

class ReviewCustomer extends StatelessWidget {
  final List<FeatureCustomer> featureCustomers;
  final List<CustomerInfo>? customerInfos;
  const ReviewCustomer(
      {super.key, required this.featureCustomers, required this.customerInfos});

  @override
  Widget build(BuildContext context) {
    if (customerInfos == null) return SizedBox.shrink();
    return ReviewContainer(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thông tin khách hàng',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 10.h,
            ),
            for (final customerInfo in customerInfos!)
              _rowData(context, customerInfo)
          ],
        ));
  }

  Widget _rowData(BuildContext context, CustomerInfo customerInfo) {
    final featureCustomer = featureCustomers.firstWhereOrNull(
        (element) => element.id == customerInfo.featureCustomerId);
    if (featureCustomer != null)
      return Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: RichText(
            text: TextSpan(
                text: '${featureCustomer.name} : ',
                style:
                    context.textTheme.body1?.copyWith(color: AppColors.nobel),
                children: [
              TextSpan(
                text: customerInfo.value,
                style:
                    context.textTheme.body1?.copyWith(color: AppColors.black),
              )
            ])),
      );
    return SizedBox.shrink();
  }
}
