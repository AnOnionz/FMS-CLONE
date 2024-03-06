import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';

class UrgencyHistoryItem extends StatelessWidget {
  const UrgencyHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 24.h, 15.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              maxLines: 3,
              text: TextSpan(
                  text: 'Ngày: ',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                  children: [
                    TextSpan(
                      text: '17/01/2024',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                    )
                  ])),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: RichText(
                maxLines: 3,
                text: TextSpan(
                    text: 'Lí do: ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                      TextSpan(
                        text: 'đi ăn',
                        style: context.textTheme.body1
                            ?.copyWith(color: AppColors.black),
                      )
                    ])),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  maxLines: 3,
                  text: TextSpan(
                      text: 'Bắt đầu: ',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nobel),
                      children: [
                        TextSpan(
                          text: '08:35',
                          style: context.textTheme.body1
                              ?.copyWith(color: AppColors.black),
                        )
                      ])),
              RichText(
                  maxLines: 3,
                  text: TextSpan(
                      text: 'Kết thúc: ',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nobel),
                      children: [
                        TextSpan(
                          text: '__:__',
                          style: context.textTheme.body1
                              ?.copyWith(color: AppColors.black),
                        )
                      ])),
            ],
          ),
        ],
      ),
    );
  }
}
