import 'package:flutter/cupertino.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';

class ProfileBox extends StatelessWidget {
  final Widget child;
  const ProfileBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.wPerc,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: child,
    );
  }
}
