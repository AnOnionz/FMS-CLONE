import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../constant/colors.dart';

class FlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;
  final String name;
  final Color color;
  const FlatButton(
      {super.key,
      required this.onPressed,
      this.icon,
      required this.name,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            SizedBox(width: icon != null ? 4.w : 0),
            Text(
              name,
              style:
                  context.textTheme.button2?.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
      style: ButtonStyle(
          shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.squared))),
          backgroundColor: MaterialStatePropertyAll<Color>(color)),
    );
  }
}
