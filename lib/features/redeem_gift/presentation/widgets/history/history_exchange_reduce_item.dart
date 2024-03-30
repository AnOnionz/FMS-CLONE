import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/redeem_gift/redeem_gift_module.dart';

import '../../../../../core/constant/colors.dart';

class HistoryExchangeReduceItem extends StatelessWidget {
  const HistoryExchangeReduceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.nextRoute(RedeemGiftModule.historyDetail),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    maxLines: 3,
                    text: TextSpan(
                        text: 'Mã đơn hàng: ',
                        style: context.textTheme.body1
                            ?.copyWith(color: AppColors.nobel),
                        children: [
                          TextSpan(
                            text: 'MA001',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.black),
                          )
                        ])),
                Text(
                  '08:30 20/10/2023',
                  style: context.textTheme.caption1
                      ?.copyWith(color: AppColors.nobel),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                      text: 'Tên KH: ',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nobel),
                      children: [
                        TextSpan(
                          text: 'Trần Nhật Tường',
                          style: context.textTheme.body1
                              ?.copyWith(color: AppColors.black),
                        )
                      ])),
            ),
            RichText(
                maxLines: 3,
                text: TextSpan(
                    text: 'SĐT KH: ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                      TextSpan(
                        text: '0909090909',
                        style: context.textTheme.body1
                            ?.copyWith(color: AppColors.black),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
