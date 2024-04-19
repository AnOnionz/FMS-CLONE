import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/sync/presentation/bloc/sync_bloc.dart';
import 'package:fms/features/sync/presentation/bloc/sync_progress_bloc.dart';

import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/widgets/button/flat.dart';
import '../widgets/expectation_task_listview.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> with GeneralMixin {
  final SyncBloc syncBloc = Modular.get();
  final SyncProgressBloc syncProgressBloc = Modular.get();

  @override
  void initState() {
    syncProgressBloc.stream.listen((state) {
      if (state is SyncProgressFailure) {
        showFailure(
          title: 'Đồng bộ thất bại',
          icon: SvgPicture.asset(AppIcons.failure),
          message: state.failure.message,
          btnText: 'Thử lại',
          onPressed: () => syncProgressBloc.add(SyncProgressStart()),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    syncProgressBloc.close();
    super.dispose();
  }

  List<FeatureEntity> _expectationSyncTask(
      Map<FeatureType, List<dynamic>> map) {
    final List<FeatureEntity> features = [];
    map.entries.forEach((element) {
      if (element.value.isNotEmpty) {
        final feature = general.config.features!
            .firstWhereOrNull((feature) => feature.type == element.key);
        if (feature != null) features.add(feature);
      }
    });
    return features;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Đồng bộ dữ liệu'),
      body: BlocBuilder<SyncBloc, SyncState>(
        bloc: syncBloc,
        builder: (context, state) {
          final isCompleted = state.status == SyncStatus.synced;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.fromLTRB(16.w, 27.h, 16.w, 0),
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _syncStatus(isCompleted),
                      Flexible(
                          child: ExpectationTaskListView(
                              features: _expectationSyncTask(state.data))),
                      BlocBuilder<SyncProgressBloc, SyncProgressState>(
                        bloc: syncProgressBloc,
                        builder: (context, state) {
                          if (state is SyncProgressLoading) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(22.w, 32.h, 22.w, 0),
                              child: LinearProgressIndicator(
                                minHeight: 8.h,
                                backgroundColor: AppColors.nobel,
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(16.sqr),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.sqr)),
                ),
              ),
              BlocBuilder<SyncProgressBloc, SyncProgressState>(
                bloc: syncProgressBloc,
                builder: (context, state) {
                  if (state is SyncProgressLoading) {
                    return SizedBox.shrink();
                  }
                  return Container(
                    decoration:
                        BoxDecoration(color: AppColors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -2),
                          blurRadius: 25.sqr,
                          color: AppColors.black.withOpacity(0.15))
                    ]),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                    child: FlatButton(
                      onPressed: isCompleted
                          ? null
                          : () async {
                              syncProgressBloc.add(SyncProgressStart());
                            },
                      name: 'Đồng bộ',
                      color: AppColors.orange,
                      disableColor: AppColors.potPourri,
                      disableTextColor: AppColors.delRio,
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  Widget _syncStatus(bool isSynchronized) {
    if (isSynchronized) {
      return Column(
        children: [
          SvgPicture.asset(
            AppIcons.upload,
            colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Text(
              'Tất cả dữ liệu đã được đồng bộ',
              style: context.textTheme.h3,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        SvgPicture.asset(AppIcons.upload),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            'Yêu cầu đồng bộ dữ liệu',
            style: context.textTheme.h3?.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}
