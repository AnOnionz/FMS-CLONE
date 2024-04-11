import 'package:flutter/material.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/home/domain/entities/feature_entity.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';

class CommonFeature extends StatefulWidget {
  final GeneralEntity general;
  const CommonFeature({super.key, required this.general});

  @override
  State<CommonFeature> createState() => _CommonFeatureState();
}

class _CommonFeatureState extends State<CommonFeature> {
  late final tasks = widget.general.config.features
      .where((feature) => feature.type != null && feature.type!.isAssistance)
      .toList();

  final double column = 4;
  final double extendHeight = 84;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (tasks.length / column).ceil() * extendHeight,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: context.screenWidth / column,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final feature = tasks[index];
              return FeatureBox(
                icon: AppIcons.sync,
                name: feature.name,
                onPressed: () => context.nextRoute('/${feature.type!.name}/',
                    arguments: FeatureEntity(
                        general: widget.general, feature: feature)),
              );
            },
          )
        ],
      ),
    );
  }
}
