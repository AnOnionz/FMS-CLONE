import 'package:flutter/material.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/attendance/domain/entities/feature_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';
import 'package:fms/features/sync/sync_module.dart';

import '../../../config/domain/entities/config_entity.dart';

class CommonFeature extends StatelessWidget {
  final GeneralEntity general;
  const CommonFeature({super.key, required this.general});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: general.config.features
            .where(
                (feature) => feature.type != null && feature.type!.isAssistance)
            .map((f) {
          return FeatureBox(
            name: f.name,
            icon: AppIcons.sync,
            onPressed: () => context.nextRoute('/${f.type!.name}/',
                arguments: FeatureEntity(general: general, feature: f)),
          );
        }).toList());
  }
}
