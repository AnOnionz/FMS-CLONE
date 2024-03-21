import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../constant/colors.dart';

class FlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final String name;
  final Color? textColor;
  final Color color;
  final Color? disableColor;
  final Color? disableTextColor;
  const FlatButton(
      {super.key,
      required this.onPressed,
      this.icon,
      required this.name,
      this.textColor = AppColors.white,
      required this.color,
      this.disableColor,
      this.disableTextColor})
      : assert(onPressed != null ||
            (onPressed == null &&
                disableColor != null &&
                disableTextColor != null));

  bool get enabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            SizedBox(width: icon != null ? 4.w : 0),
            Flexible(
              child: FittedBox(
                child: Text(
                  name,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.button2
                      ?.copyWith(color: enabled ? textColor : disableTextColor),
                ),
              ),
            ),
          ],
        ),
        style: ButtonStyle(
            shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.squared))),
            backgroundColor: MaterialStatePropertyAll<Color>(
                enabled ? color : disableColor!)),
      ),
    );
  }
}
