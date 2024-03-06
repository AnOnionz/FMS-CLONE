import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  final ValueNotifier<bool> start;
  const StopWatch({super.key, required this.start});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void initState() {
    widget.start.addListener(() {
      if (widget.start.value) {
        _stopWatchTimer.onStartTimer();
      } else {
        _stopWatchTimer.onResetTimer();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: _stopWatchTimer.rawTime.value,
          builder: (context, snap) {
            final value = snap.data!;
            final displayTime =
                StopWatchTimer.getDisplayTime(value, milliSecond: false);
            return Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                displayTime,
                style: context.textTheme.caption1?.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ],
    );
  }
}
