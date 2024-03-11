import 'package:flutter/material.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';
import 'package:fms/routes/routes.dart';

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
          onPressed: () => context.nextRoute(Routes.redeemGift),
        ),
        FeatureBox(
          name: 'Thống kê',
          icon: AppIcons.statistic,
          onPressed: () => context.nextRoute(Routes.statistic),
        ),
        FeatureBox(
          name: 'Báo khẩn',
          icon: AppIcons.report,
          onPressed: () => context.nextRoute(Routes.urgency),
        ),
        FeatureBox(
          name: 'Nghỉ phép',
          icon: AppIcons.report,
          onPressed: () => context.nextRoute(Routes.leave),
        )
      ],
    );
  }
}
