import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/date_picker.dart';

class ProfileDatePicker extends StatelessWidget {
  final String title;
  final DateTime? lastDate;
  final Function(DateTime time) onChanged;
  const ProfileDatePicker(
      {super.key, this.lastDate, required this.onChanged, required this.title});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
        lastDate: lastDate,
        onSelected: onChanged,
        decoration: InputDecoration(
            hintText: title,
            hintStyle:
                context.textTheme.body1?.copyWith(color: AppColors.nobel),
            label: RichText(
                text: TextSpan(
                    text: title,
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [])),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            suffixIconConstraints: BoxConstraints(),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                AppIcons.calendar,
                height: 18.w,
                colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sqr),
                borderSide: BorderSide(color: AppColors.nobel)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sqr),
                borderSide: BorderSide(color: AppColors.nobel)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sqr),
                borderSide: BorderSide(color: AppColors.fireBrick, width: 2.h)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sqr),
                borderSide:
                    BorderSide(color: AppColors.summerSky, width: 2.h))));
  }
}
