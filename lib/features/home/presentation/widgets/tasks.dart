import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/home/presentation/widgets/task_box.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/popup.dart';
import '../bloc/necessary_bloc.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> with GeneralMixin {
  final NecessaryBloc _necessaryBloc = Modular.get();
  late final tasks = general.config.features
      ?.where((feature) => feature.type != null && !feature.type!.isAssistance)
      .toList();
  final double columns = 3;
  late final rows = (tasks!.length / columns).ceil();
  final double extendHeight = 172;

  @override
  void initState() {
    _necessaryBloc.stream.listen((state) {
      if (state is NecessaryBlock) {
        showWarning(
            title: 'Yêu cầu chấm công',
            icon: SvgPicture.asset(AppIcons.requiredAttendance),
            btnText: 'Đóng',
            onPressed: () => context.pop());
      }
      if (state is NecessaryUncensored) {
        context.nextRoute('/${state.feature.type!.name}/',
            arguments:
                GeneralItemData(general: general, feature: state.feature));
      }
    });
    super.initState();
  }

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
                onPressed: () => _necessaryBloc
                    .add(NecessaryIn(general: general, feature: feature)),
              );
            },
          )
        ],
      ),
    );
  }
}
