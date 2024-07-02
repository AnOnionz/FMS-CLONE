import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/date_picker.dart';

class ProfileDatePicker extends StatefulWidget {
  final String label;
  final DateTime? lastDate;
  final Function(DateTime time) onChanged;
  final bool isRequired;

  const ProfileDatePicker(
      {super.key,
      this.lastDate,
      required this.onChanged,
      required this.label,
      this.isRequired = false});

  @override
  State<ProfileDatePicker> createState() => _ProfileDatePickerState();
}

class _ProfileDatePickerState extends State<ProfileDatePicker> {
  ValueNotifier<bool> isError = ValueNotifier(false);

  void setIsError(bool value) {
    isError.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return DatePicker(
        lastDate: widget.lastDate,
        onSelected: widget.onChanged,
        validator: (value) {
          if (widget.isRequired) {
            if (value.isEmptyOrNull) {
              setIsError(true);
              return 'Bắt buộc nhập';
            } else {
              setIsError(false);
            }
          }
          setIsError(false);
          return null;
        },
        decoration: InputDecoration(
            hintText: widget.label,
            hintStyle:
                context.textTheme.body1?.copyWith(color: AppColors.nobel),
            label: RichText(
                text: TextSpan(
                    text: widget.label,
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                    children: [
                  if (widget.isRequired)
                    TextSpan(
                        text: ' *',
                        style: context.textTheme.body1
                            ?.copyWith(color: AppColors.brickRed))
                ])),
            suffixIcon: ValueListenableBuilder(
                valueListenable: isError,
                builder: (context, value, child) => !value
                    ? Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: SvgPicture.asset(
                          AppIcons.calendar,
                          height: 18.w,
                          colorFilter: ColorFilter.mode(
                              AppColors.nobel, BlendMode.srcIn),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: SvgPicture.asset(AppIcons.error),
                      )),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            suffixIconConstraints: BoxConstraints(),
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
