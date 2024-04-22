import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  const NoteTextField({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 4,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        hintText: 'Nội dung',
        hintStyle: context.textTheme.body1?.copyWith(color: '2A2C2D'.toColor()),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.gainsboro,
            ),
            borderRadius: BorderRadius.circular(13.33.sqr)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.gainsboro,
            ),
            borderRadius: BorderRadius.circular(13.33.sqr)),
      ),
    );
  }
}
