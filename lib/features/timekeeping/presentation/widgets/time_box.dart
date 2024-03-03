import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

enum timekeepingType { checkin, checkout }

class TimeBox extends StatelessWidget {
  final timekeepingType type;
  final DateTime? time;
  const TimeBox({super.key, required this.type, this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getName(),
          style: context.textTheme.subtitle1?.copyWith(color: AppColors.nobel),
        ),
        SizedBox(
          height: 6.h,
        ),
        timeText(context)
      ],
    );
  }

  String getName() {
    return switch (type) {
      timekeepingType.checkin => 'Chấm công vào',
      timekeepingType.checkout => 'Chấm công ra'
    };
  }

  Widget timeText(BuildContext context) {
    String timeString(int? value) {
      return switch (value) { != null => value.toString(), _ => '_ _' };
    }

    final int? h = time?.hour;
    final int? m = time?.minute;
    final int? s = time?.second;

    return Text('${timeString(h)}:${timeString(m)}:${timeString(s)}',
        style: context.textTheme.subtitle1?.copyWith(
            color: time == null ? AppColors.nobel : AppColors.black));
  }
}
