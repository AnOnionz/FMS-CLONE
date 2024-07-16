import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/mapper.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';
import 'package:fms/features/sampling/domain/entities/sampling_value_entity.dart';
import 'package:fms/features/sampling/presentation/cubit/get_samplings_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../../core/widgets/popup.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../bloc/sampling_bloc.dart';
import '../widgets/sampling_item.dart';

class SamplingsPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const SamplingsPage({super.key, required this.entity});

  @override
  State<SamplingsPage> createState() => _SamplingsPageState();
}

class _SamplingsPageState extends State<SamplingsPage> {
  final networkTimeService = Modular.get<NetworkTimeService>();

  late final _featureSamplings = widget.entity.feature.featureSamplings ?? [];
  final _cubit = Modular.get<GetSamplingsCubit>();
  final _bloc = Modular.get<SamplingBloc>();

  SamplingEntity _sampling = SamplingEntity(
      dataUuid: Uuid().v1(), dataTimestamp: DateTime.now(), values: []);

  StreamSubscription<SamplingState>? _samplingSubscription;

  bool get isActive =>
      _sampling.status == SyncStatus.isNoSynced &&
      _sampling.values.any((value) => value.value != null);

  @override
  void initState() {
    super.initState();
    fetchSamplings();
    _bloc.stream.listen((state) {
      if (state is SamplingLoading) {
        OverlayManager.showLoading();
      }
      if (state is SamplingFailure || state is SamplingSuccess) {
        OverlayManager.hide();
        showSuccess(title: 'Lưu thành công');
      }
    });
  }

  @override
  void dispose() {
    _samplingSubscription?.cancel();
    super.dispose();
  }

  void fetchSamplings() {
    _cubit.getSamplings(widget.entity);
  }

  void onFetchSuccess(SamplingEntity? sampling) {
    if (sampling != null) {
      _sampling = sampling.copyWith();
    } else {
      _sampling = _sampling.copyWith(
          values: _featureSamplings
              .map((e) => SamplingValueEntity(featureSamplingId: e.id!))
              .toList());
    }
    setState(() {});
  }

  void onUpdateSamplingValue(String value, FeatureSampling featureSampling) {
    final int? samplingValue = int.tryParse(value);

    final rate =
        (featureSampling.numerator ?? 1) / (featureSampling.denominator ?? 1);

    final conversionValue =
        samplingValue == null ? null : (rate * samplingValue).ceil();

    final initialSamplingValueEntity =
        SamplingValueEntity(featureSamplingId: featureSampling.id);

    final samplingValueEntity = _sampling.values.firstWhere(
        (element) => element.featureSamplingId == featureSampling.id);

    _sampling.values[_sampling.values.indexOf(initialSamplingValueEntity)] =
        samplingValueEntity.copyWith(
            value: Value(object: samplingValue),
            conversionRate: rate,
            conversionValue: Value(object: conversionValue));

    _sampling.status = SyncStatus.isNoSynced;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name ?? ''),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<GetSamplingsCubit, GetSamplingsState>(
                  bloc: _cubit,
                  listener: (context, state) {
                    if (state is GetSamplingsSuccess) {
                      onFetchSuccess(state.entity);
                    }
                    if (state is GetSamplingsFailure) {
                      showFailure(
                        title: 'Tải dữ liệu thất bại',
                        icon: SvgPicture.asset(AppIcons.failure),
                        message: state.failure.message,
                        btnText: 'Thử lại',
                        onPressed: () async {
                          await Future.delayed(
                            300.milliseconds,
                            () => fetchSamplings(),
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetSamplingsSuccess) {
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverPadding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              sliver: SliverList.builder(
                                itemCount: _featureSamplings.length,
                                itemBuilder: (context, index) {
                                  final featureSampling =
                                      _featureSamplings[index];
                                  final sampling = _sampling.values
                                      .firstWhereOrNull((element) =>
                                          element.featureSamplingId ==
                                          featureSampling.id);
                                  return SamplingItem(
                                      entity: sampling,
                                      featureSampling: featureSampling,
                                      onChanged: (value) =>
                                          onUpdateSamplingValue(
                                              value, featureSampling));
                                },
                              ))
                        ],
                      );
                    }
                    if (state is GetSamplingsFailure) {
                      return Center(
                        child: DataLoadErrorWidget(
                            onPressed: () => fetchSamplings()),
                      );
                    }
                    return Center(child: AppIndicator());
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 25,
                      color: AppColors.black.withOpacity(0.15))
                ]),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: FlatButton(
                  onPressed: isActive
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          _bloc.add(UpdateSampling(
                              entity: _sampling,
                              attendanceId:
                                  widget.entity.general.attendance!.id!,
                              featureId: widget.entity.feature.id!));
                        }
                      : null,
                  name: 'Lưu',
                  color: AppColors.orange,
                  disableColor: AppColors.potPourri,
                  disableTextColor: AppColors.delRio,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
