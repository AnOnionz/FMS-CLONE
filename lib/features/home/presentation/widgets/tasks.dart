import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TaskBox()),
        SizedBox(width: 16.w),
        Expanded(child: TaskBox()),
        SizedBox(width: 16.w),
        Expanded(child: TaskBox())
      ],
    );
  }
}
