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
  double defaultHeight = 165.h;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: widget.general.config.features
            .where((feature) =>
                feature.type != null && !feature.type!.isAssistance)
            .map((f) => Expanded(
                    child: TaskBox(
                  height: defaultHeight,
                  onHeightUpdated: (newValue) {
                    setState(() {
                      defaultHeight = newValue;
                    });
                  },
                  name: f.name,
                  onPressed: () => context.nextRoute('/${f.type!.name}/',
                      arguments:
                          FeatureEntity(general: widget.general, feature: f)),
                )))
            .toList(),
      ),
    );
  }
}
