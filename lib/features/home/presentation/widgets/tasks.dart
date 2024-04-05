import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/attendance/attendance_out_module.dart';
import 'package:fms/features/attendance/domain/entities/feature_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';
import 'package:fms/features/redeem_gift/redeem_gift_module.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:fms/features/report/report_module.dart';

class Tasks extends StatelessWidget {
  final GeneralEntity general;
  const Tasks({super.key, required this.general});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: general.config.features
          .where(
              (feature) => feature.type != null && !feature.type!.isAssistance)
          .map((f) => Expanded(
                  child: TaskBox(
                name: f.name,
                onPressed: () => context.nextRoute(AttendanceOutModule.route,
                    arguments: FeatureEntity(general: general, feature: f)),
              )))
          .toList(),
    );
  }
}
