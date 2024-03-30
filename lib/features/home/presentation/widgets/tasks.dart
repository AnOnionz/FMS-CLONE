import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/attendance/attendance_module.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';
import 'package:fms/features/redeem_gift/redeem_gift_module.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:fms/features/report/report_module.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TaskBox(
          name: 'Chấm công',
          onPressed: () => context.nextRoute(AttendanceModule.route),
        )),
        SizedBox(width: 16.w),
        Expanded(
            child: TaskBox(
                name: 'Đổi quà',
                onPressed: () => context.nextRoute(RedeemGiftModule.route))),
        SizedBox(width: 16.w),
        Expanded(
            child: TaskBox(
                name: 'Báo cáo',
                onPressed: () {
                  final reports = [
                    ReportEntity(
                        name: 'Hình tổng quan',
                        min: 3,
                        max: 5,
                        description:
                            'Hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình ',
                        files: []),
                    ReportEntity(
                        name: 'Hình POSM',
                        min: 3,
                        max: 3,
                        description:
                            'Hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình ',
                        files: []),
                    ReportEntity(
                        name: 'Hình POSM',
                        min: 3,
                        max: 3,
                        description:
                            'Hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình ',
                        files: [])
                  ];
                  context.nextRoute(ReportModule.route, arguments: reports);
                }))
      ],
    );
  }
}
