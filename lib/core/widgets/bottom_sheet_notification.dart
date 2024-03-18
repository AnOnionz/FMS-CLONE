import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/colors.dart';

class BottomSheetNotification extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? message;
  final Widget action;
  const BottomSheetNotification(
      {super.key,
      required this.icon,
      required this.title,
      this.message,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
          child: icon,
        ),
        Text(title,
            style: context.textTheme.h2?.copyWith(color: AppColors.nightRider)),
        SizedBox(height: 8.h),
        message != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nero),
                ),
              )
            : SizedBox(height: 37.h),
        action
      ],
    );
  }
}
