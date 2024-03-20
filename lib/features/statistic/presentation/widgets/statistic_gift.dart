import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/item_container.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/styles/theme.dart';

class StatisticGift extends StatelessWidget {
  const StatisticGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 24.w, bottom: 16.h),
            child: RichText(
                text: TextSpan(
                    text: 'Tổng số lượng quà phát ra:  ',
                    style: context.textTheme.body2
                        ?.copyWith(color: AppColors.black),
                    children: [
                  TextSpan(text: '1200', style: context.textTheme.caption1)
                ])),
          ),
          Expanded(
              child: ListView.builder(
            physics: kPhysics,
            itemCount: 20,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              margin: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.squared),
              ),
              child: ItemContainer(
                  leading: Image.asset(AppImages.loginBanner),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên sản phẩm',
                        style: context.textTheme.caption1,
                      ),
                      Text(
                        'MA0001223',
                        style: context.textTheme.caption2
                            ?.copyWith(color: AppColors.nobel),
                      ),
                      Text(
                        'Loại: posm',
                        style: context.textTheme.caption2
                            ?.copyWith(color: AppColors.nobel),
                      )
                    ],
                  ),
                  trailing: RichText(
                      text: TextSpan(
                          text: '100',
                          style: context.textTheme.body1
                              ?.copyWith(color: AppColors.black),
                          children: [
                        TextSpan(
                            text: ' cái',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.nobel))
                      ]))),
            ),
          ))
        ],
      ),
    );
  }
}
