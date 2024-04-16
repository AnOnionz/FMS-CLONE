import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/home/presentation/bloc/necessary_bloc.dart';
import 'package:fms/features/home/presentation/widgets/feature_box.dart';

class CommonFeature extends StatefulWidget {
  const CommonFeature({super.key});

  @override
  State<CommonFeature> createState() => _CommonFeatureState();
}

class _CommonFeatureState extends State<CommonFeature> with GeneralMixin {
  final NecessaryBloc _necessaryBloc = Modular.get();
  late final tasks = general.config.features
      ?.where((feature) => feature.type != null && feature.type!.isAssistance)
      .toList();

  final double column = 4;
  final double extendHeight = 84;

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
            itemCount: tasks!.length,
            itemBuilder: (context, index) {
              final feature = tasks![index];

              return FeatureBox(
                icon: AppIcons.sync,
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
