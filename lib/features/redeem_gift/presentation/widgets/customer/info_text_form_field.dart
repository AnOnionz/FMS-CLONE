import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';

class InfoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  const InfoTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
          label: RichText(
              text: TextSpan(
                  text: label,
                  style: context.textTheme.body1?.copyWith(
                      color: focusNode.hasFocus
                          ? AppColors.summerSky
                          : AppColors.nobel),
                  children: [
                TextSpan(
                    text: '*',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.brickRed))
              ])),
          hintStyle: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.squared),
              borderSide: BorderSide(color: AppColors.nobel)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.squared),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.squared),
              borderSide: BorderSide(color: AppColors.fireBrick, width: 2.h)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.squared),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h))),
    );
  }
}
