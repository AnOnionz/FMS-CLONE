import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import '../../../../core/constant/colors.dart';

class AttendanceDetailItem extends StatelessWidget {
  const AttendanceDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Trần Nhật Tường',
                      style: context.textTheme.caption1
                          ?.copyWith(color: AppColors.nero)),
                  Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text('ma0001', style: context.textTheme.body2)),
                  // Padding(
                  //     padding: EdgeInsets.only(top: 6.h),
                  //     child: Text('Booth A', style: context.textTheme.body2))
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.whisper,
              endIndent: 20.w,
              indent: 20.w,
            ),
            Expanded(flex: 3, child: AttendanceDataDetail())
          ],
        ),
      ),
    );
  }
}

class AttendanceDataDetail extends StatelessWidget {
  const AttendanceDataDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _item(context, 1)),
        Expanded(child: _item(context, null))
      ],
    );
  }

  Widget _item(BuildContext context, dynamic data) {
    if (data != null) {
      return Column(
        children: [
          Text('Vào',
              style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SizedBox(
                height: 80.w,
                width: 80.w,
                child: Image.asset(
                  AppImages.loginBanner,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Text(
            '08:35',
            style: context.textTheme.caption3
                ?.copyWith(color: AppColors.midnightExpress),
          )
        ],
      );
    }
    return Column(children: [
      Text('Ra',
          style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          height: 80.w,
          width: 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sqr),
              border: Border.all(color: AppColors.gainsboro, width: 0.5)),
        ),
      ),
      Text('__:__')
    ]);
  }
}
