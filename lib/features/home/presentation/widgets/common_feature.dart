import 'package:flutter/material.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';
import 'package:fms/features/leave/leave_module.dart';
import 'package:fms/features/statistic/statistic_module.dart';
import 'package:fms/features/sync/sync_module.dart';
import 'package:fms/features/urgency/urgency_module.dart';

class CommonFeature extends StatelessWidget {
  const CommonFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FeatureBox(
          name: 'Đồng bộ',
          icon: AppIcons.sync,
          onPressed: () => context.nextRoute(SyncModule.route),
        ),
        FeatureBox(
          name: 'Thống kê',
          icon: AppIcons.statistic,
          onPressed: () => context.nextRoute(StatisticModule.route),
        ),
        FeatureBox(
          name: 'Báo khẩn',
          icon: AppIcons.report,
          onPressed: () => context.nextRoute(UgrencyModule.route),
        ),
        FeatureBox(
          name: 'Nghỉ phép',
          icon: AppIcons.report,
          onPressed: () => context.nextRoute(LeaveModule.route),
        )
      ],
    );
  }
}
