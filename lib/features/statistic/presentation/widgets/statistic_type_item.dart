import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';

class StatisticItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String? subTitle;
  const StatisticItem(
      {super.key, required this.onPressed, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.sqr),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                color: '#3151CF'.toColor(0.25),
              )
            ]),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: context.textTheme.subtitle1
                        ?.copyWith(color: AppColors.nero)),
                (subTitle != null)
                    ? Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Text(subTitle!, style: context.textTheme.body1))
                    : SizedBox.shrink()
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 30.sp,
              color: 'C3C6C9'.toColor(),
            )
          ],
        ),
      ),
    );
  }
}
