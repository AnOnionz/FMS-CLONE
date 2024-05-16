import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class PurchaseContainer extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool titleFlexible;
  PurchaseContainer(
      {super.key,
      required this.trailing,
      required this.title,
      required this.leading,
      this.titleFlexible = true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
              height: 65.w,
              width: 65.w,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.roseWhite.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.sqr)),
                  ),
                  Align(alignment: Alignment.centerLeft, child: leading),
                ],
              )),
          SizedBox(
            width: 18.h,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (titleFlexible)
                Flexible(child: title)
              else
                Expanded(child: title),
              Flexible(child: trailing)
            ],
          ))
        ],
      ),
    );
  }
}
