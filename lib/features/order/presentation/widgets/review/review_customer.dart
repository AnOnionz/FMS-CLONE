import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';

class ReviewCustomer extends StatelessWidget {
  const ReviewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 22.h,
            ),
            RichText(
                text: TextSpan(
                    text: 'Tên khách hàng : ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                  TextSpan(
                    text: 'Trần Nhật Tường',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.black),
                  )
                ])),
            SizedBox(
              height: 12.h,
            ),
            RichText(
                text: TextSpan(
                    text: 'Số điện thoại : ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                  TextSpan(
                    text: '0909090909',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.black),
                  )
                ])),
            SizedBox(
              height: 12.h,
            ),
            RichText(
                text: TextSpan(
                    text: 'Mã hóa đơn : ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                  TextSpan(
                    text: 'MHD00001111',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.black),
                  )
                ]))
          ],
        ));
  }
}
