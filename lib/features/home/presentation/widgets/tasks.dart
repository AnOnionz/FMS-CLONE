import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';

import '../bloc/necessary_bloc.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> with GeneralMixin {
  late final tasks = general.config.features
      ?.where((feature) => feature.type != null && !feature.type!.isAssistance)
      .toList();
  final double columns = 3;
  late final rows = (tasks!.length / columns).ceil();
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
            itemCount: tasks!.length,
            itemBuilder: (context, index) {
              final feature = tasks![index];
              return TaskBox(
                height: extendHeight,
                name: feature.name!,
                onPressed: () => context
                    .read<NecessaryBloc>()
                    .add(NecessaryIn(feature: feature)),
              );
            },
          )
        ],
      ),
    );
  }
}
