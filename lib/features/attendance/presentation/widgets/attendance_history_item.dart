import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryItem extends StatelessWidget {
  const AttendanceHistoryItem({super.key});

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
                      text: '17/01/2023',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                    )
                  ])),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: attendanceDataBox(context, Alignment.centerLeft,
                      name: 'Chấm công vào: ', time: DateTime.now()),
                ),
                Expanded(
                  child: attendanceDataBox(context, Alignment.centerRight,
                      name: 'Chấm công ra: ', time: DateTime.now()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget attendanceDataBox(BuildContext context, AlignmentGeometry alignment,
      {required String name, required DateTime time}) {
    return Column(
      children: [
        Align(
          alignment: alignment,
          child: RichText(
              maxLines: 3,
              text: TextSpan(
                  text: name,
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                  children: [
                    TextSpan(
                      text: DateFormat('HH:mm').format(time),
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                    )
                  ])),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 10.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.squared),
            child: ColoredBox(
              color: Colors.amber,
              child: Image.asset(
                AppImages.loginBanner,
                height: 65.h,
                width: 65.h,
              ),
            ),
          ),
        )
      ],
    );
  }
}
