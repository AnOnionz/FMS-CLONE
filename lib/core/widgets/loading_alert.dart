import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/app_indicator.dart';

class LoadingAlert extends StatelessWidget {
  final String message;
  const LoadingAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sqr),
      ),
      elevation: 5.0,
      insetPadding: EdgeInsets.symmetric(horizontal: 8.w),
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 200.h,
        width: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIndicator(
              height: 50,
              width: 50,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: context.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
