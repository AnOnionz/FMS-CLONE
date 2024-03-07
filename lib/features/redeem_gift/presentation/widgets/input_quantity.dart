import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class InputQuantity extends StatelessWidget {
  const InputQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttonQuantity(child: SvgPicture.asset(AppIcons.remove)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            '0',
            style: context.textTheme.body2?.copyWith(color: AppColors.nobel),
          ),
        ),
        _buttonQuantity(child: SvgPicture.asset(AppIcons.add)),
      ],
    );
  }

  Widget _buttonQuantity({required Widget child}) {
    return Container(
      height: 30.h,
      width: 30.h,
      decoration: BoxDecoration(
          color: '#F3F3F3'.toColor(),
          borderRadius: BorderRadius.circular(8.squared)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: child,
      ),
    );
  }
}
