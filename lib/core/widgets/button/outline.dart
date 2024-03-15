import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class OutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final String name;
  final Color color;
  const OutlineButton(
      {super.key,
      required this.onPressed,
      this.icon,
      required this.name,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: icon!,
                  ),
            Flexible(
              child: Text(
                textScaler: TextScaler.linear(1),
                name,
                style: context.textTheme.button2?.copyWith(color: color),
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          side: MaterialStatePropertyAll<BorderSide>(BorderSide(color: color)),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.squared))),
        ),
      ),
    );
  }
}
