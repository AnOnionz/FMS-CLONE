import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class ItemContainer extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool titleFlexible;
  ItemContainer(
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
              height: 65.h,
              width: 65.h,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.roseWhite.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.squared)),
                  ),
                  Align(alignment: Alignment.centerLeft, child: leading),
                ],
              )),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (titleFlexible) Flexible(child: title) else title,
              Flexible(child: trailing)
            ],
          ))
        ],
      ),
    );
  }
}
