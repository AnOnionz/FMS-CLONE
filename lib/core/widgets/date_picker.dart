import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class DatePicker extends StatefulWidget {
  final Color? fillColor;
  DatePicker({super.key, this.fillColor});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController controller = TextEditingController();

  Future<void> selectDay(BuildContext context) async {
    final selectedDay = await showDatePicker(
        context: context,
        firstDate: DateTime.parse('2000-01-01'),
        lastDate: DateTime.parse('2100-01-31'));

    if (selectedDay != null) {
      setState(() {
        controller.text = kdMy.format(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => selectDay(context),
      style: context.textTheme.body1,
      decoration: InputDecoration(
          hintText: 'Chọn ngày',
          hintStyle: context.textTheme.subtitle1,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          suffixIconConstraints: BoxConstraints(),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              AppIcons.calendar,
              height: 24.h,
              colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.sqr),
              borderSide: BorderSide(color: '#EA9567'.toColor())),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.sqr),
              borderSide: BorderSide(color: '#EA9567'.toColor()))),
    );
  }
}
