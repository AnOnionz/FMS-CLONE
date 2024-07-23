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
  final DateTime? createdDate;
  const ReviewCustomer(
      {super.key,
      required this.featureCustomers,
      required this.customerInfos,
      this.createdDate});

  @override
  Widget build(BuildContext context) {
    featureCustomers.sort(
      (a, b) => a.ordinal! - b.ordinal!,
    );
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
            for (final featureCustomer in featureCustomers)
              _rowData(context, featureCustomer),
            if (createdDate != null)
              Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thời gian : ',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.nobel)),
                        Text(
                          createdDate!.formatBy(khmdMy),
                          style: context.textTheme.body1
                              ?.copyWith(color: AppColors.black),
                        )
                      ],
                    ),
                  ))
          ],
        ));
  }

  Widget _rowData(BuildContext context, FeatureCustomer featureCustomer) {
    final customerInfo = (customerInfos ?? []).firstWhereOrNull(
        (element) => element.featureCustomerId == featureCustomer.id);

    return Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${featureCustomer.name} : ',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.nobel)),
              (customerInfo?.options ?? []).isEmpty
                  ? Flexible(
                      child: Text(
                        customerInfo?.value ?? '',
                        style: context.textTheme.body1
                            ?.copyWith(color: AppColors.black),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: customerInfo!.options!.map((option) {
                        final options = featureCustomer.options!;
                        final opt = options.firstWhereOrNull((element) =>
                            element.id == option.featureCustomerOptionId);
                        if (customerInfo.options!.length == 1)
                          return Text(
                            '${opt?.name!}',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.black),
                          );
                        if (opt != null)
                          return Text(
                            ' - ${opt.name!}',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.black),
                          );

                        return SizedBox.shrink();
                      }).toList(),
                    )
            ],
          ),
        ));
  }
}
