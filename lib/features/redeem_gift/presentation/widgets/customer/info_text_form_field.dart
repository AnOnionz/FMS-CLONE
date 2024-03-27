import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';

class InfoTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? Function(String? value)? validate;
  const InfoTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      required this.focusNode,
      this.validate});

  @override
  State<InfoTextFormField> createState() => _InfoTextFormFieldState();
}

class _InfoTextFormFieldState extends State<InfoTextFormField> {
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: (value) {
        if (widget.validate != null) {
          final error = widget.validate?.call(value);
          if (error != null) {
            setState(() {
              isValid = false;
            });
          } else {
            setState(() {
              isValid = true;
            });
          }
          return error;
        }
        return null;
      },
      style: context.textTheme.body1,
      cursorHeight: 16.sp,
      cursorColor: AppColors.summerSky,
      decoration: InputDecoration(
          label: RichText(
              text: TextSpan(
                  text: widget.label,
                  style: context.textTheme.body1?.copyWith(
                      color: widget.focusNode.hasFocus
                          ? AppColors.summerSky
                          : AppColors.nobel),
                  children: [
                TextSpan(
                    text: '*',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.brickRed))
              ])),
          suffixIcon: isValid
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: SvgPicture.asset(AppIcons.error),
                ),
          suffixIconConstraints: BoxConstraints(),
          hintStyle: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.nobel)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.fireBrick, width: 2.h)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h))),
    );
  }
}
