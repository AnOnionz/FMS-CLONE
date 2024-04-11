import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:intl/intl.dart';

class TimeBox extends StatelessWidget {
  final AttendanceType type;
  final DateTime? time;
  const TimeBox({super.key, required this.type, this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type.name,
          style: context.textTheme.subtitle1?.copyWith(color: AppColors.nobel),
        ),
        SizedBox(
          height: 6.h,
        ),
        timeText(context)
      ],
    );
  }

  Widget timeText(BuildContext context) {
    final str = switch (time) {
      != null => time!.formatBy(DateFormat('HH:mm:ss')),
      _ => '_ _'
    };

    return Text(str,
        style: context.textTheme.subtitle1?.copyWith(
            color: time == null ? AppColors.nobel : AppColors.black));
  }
}
