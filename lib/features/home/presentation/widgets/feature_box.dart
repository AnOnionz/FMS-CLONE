import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class FeatureBox extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback? onPressed;
  const FeatureBox(
      {super.key, required this.name, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.squared),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6),
                  blurRadius: 20,
                  color: '#888888'.toColor(0.1))
            ]),
        child: Padding(
          padding:
              EdgeInsets.only(top: 12.h, bottom: 16.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                height: 11.h,
              ),
              Text(
                name,
                style: context.textTheme.caption3
                    ?.copyWith(color: AppColors.nobel),
              )
            ],
          ),
        ),
      ),
    );
  }
}
