import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';

class ReviewContainer extends StatelessWidget {
  final EdgeInsets margin;
  final Widget child;
  const ReviewContainer({super.key, required this.margin, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      margin: margin,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.squared)),
      child: child,
    );
  }
}
