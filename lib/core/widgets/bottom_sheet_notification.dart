import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/colors.dart';

class BottomSheetNotification extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget? message;
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
          padding: EdgeInsets.only(top: 28.h, bottom: 16.h),
          child: icon,
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: context.textTheme.h2?.copyWith(color: AppColors.nightRider)),
        SizedBox(height: 8.h),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: message ?? SizedBox(),
          ),
        ),
        action
      ],
    );
  }
}
