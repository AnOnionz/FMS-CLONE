import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mText = DateFormat.MMMM().format(focusedDay);
    final yText = focusedDay.year.toString();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onLeftArrowTap,
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: '#CED3DE'.toColor()),
                borderRadius: BorderRadius.circular(8.sqr)),
            child: Center(
                child: Icon(
              Icons.chevron_left,
              size: 30.h,
            )),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: [
                Text(
                  mText,
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: '#222B45'.toColor()),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  yText,
                  style: context.textTheme.body1
                      ?.copyWith(color: '#8F9BB3'.toColor()),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onRightArrowTap,
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: '#CED3DE'.toColor()),
                borderRadius: BorderRadius.circular(8.sqr)),
            child: Center(
                child: Icon(
              Icons.chevron_right,
              size: 30.h,
            )),
          ),
        ),
      ],
    );
  }
}
