import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/home/domain/entities/feature_entity.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';

class Tasks extends StatefulWidget {
  final GeneralEntity general;
  const Tasks({super.key, required this.general});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  late final tasks = widget.general.config.features
      .where((feature) => feature.type != null && !feature.type!.isAssistance)
      .toList();
  final double columns = 3;
  late final rows = (tasks.length / columns).ceil();
  final double extendHeight = 172;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rows * extendHeight + (rows - 1) * 15,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.screenWidth / columns,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: extendHeight),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final feature = tasks[index];
              return TaskBox(
                height: extendHeight,
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
