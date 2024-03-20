import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';

import '../../../../routes/routes.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TaskBox(
          name: 'Chấm công',
          onPressed: () => context.nextRoute(Routes.locate),
        )),
        SizedBox(width: 16.w),
        Expanded(
            child: TaskBox(
                name: 'Đổi quà',
                onPressed: () => context.nextRoute(Routes.redeemGift))),
        SizedBox(width: 16.w),
        Expanded(
            child: TaskBox(
                name: 'Ghi chú',
                onPressed: () => context.nextRoute(Routes.note)))
      ],
    );
  }
}
