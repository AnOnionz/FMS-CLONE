import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class LeaveHistoryItem extends StatelessWidget {
  const LeaveHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26.w, 24.h, 0, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              maxLines: 3,
              text: TextSpan(
                  text: 'Lý do xin nghỉ phép: ',
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                  children: [
                    TextSpan(
                      text: 'Lorem ipsum dolor sit amet',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                    )
                  ])),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: SvgPicture.asset(AppIcons.calendar),
                ),
                Text('17/10/2023', style: context.textTheme.caption1),
                SizedBox(
                  width: 30.w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: SvgPicture.asset(AppIcons.clock),
                ),
                Text('08:30 - 12:30', style: context.textTheme.caption1)
              ],
            ),
          ),
          Text('Chưa duyệt',
              style:
                  context.textTheme.caption1?.copyWith(color: AppColors.nobel))
        ],
      ),
    );
  }
}
