import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../work_place/domain/usecases/params.dart';
import '../../domain/usecases/get_config_usecase.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUsecase getConfig;
  final GetAttendanceInfoUsecase getAttendanceInfo;
  final GeneralBloc generalBloc;
  ConfigBloc(
      {required this.getAttendanceInfo,
      required this.getConfig,
      required this.generalBloc})
      : super(ConfigInitial()) {
    on<FetchConfig>((event, emit) async {
      emit(ConfigLoading());
      OverlayManager.showLoading();
      final execute = await getConfig(WorkPlaceParams(enitty: event.workPlace));
      final config = execute.fold((fail) {
        emit(ConfigFailure(fail));
        return null;
      }, (config) => config);

      if (config != null) {
        GeneralEntity general = GeneralEntity(
            project: event.workPlace.project!,
            outlet: event.workPlace.outlet!,
            booth: event.workPlace.booth!,
            config: config);

        /// get attendance info
        final featureAttendance = config.features.firstWhereOrNull(
            (feature) => feature.type == FeatureType.attendanceClockingIn);
        if (featureAttendance != null) {
          final execute = await getAttendanceInfo(AttendanceParams(
              time: DateTime.now(),
              feature: featureAttendance,
              general: general));

          final attendanceInfo = execute.fold((failure) {
            emit(ConfigFailure(failure));
            return null;
          }, (data) => data);
          if (attendanceInfo != null) {
            general = general.copyWith(attendance: attendanceInfo);
          }
        }

        OverlayManager.hide();
        generalBloc.add(GeneralStared(general: general));
        Modular.to.navigate(HomeModule.route);
        emit(ConfigSuccess(config));
      } else {
        OverlayManager.hide();
        OverlayManager.showSnackbar(
            snackbar:
                SnackBar(content: Text('Không tìm thấy cài đặt của dự án')));
      }
    }, transformer: droppable());
  }
}
