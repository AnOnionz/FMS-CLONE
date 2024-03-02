import 'package:flutter/material.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';

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
        ),
        FeatureBox(
          name: 'Thống kê',
          icon: AppIcons.statistic,
        ),
        FeatureBox(
          name: 'Báo khẩn',
          icon: AppIcons.report,
        ),
        FeatureBox(
          name: 'Nghỉ phép',
          icon: AppIcons.report,
        )
      ],
    );
  }
}
