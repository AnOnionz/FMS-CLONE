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
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIndicator(
              height: 60.h,
              width: 60.h,
            ),
            SizedBox(height: 18.h),
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
