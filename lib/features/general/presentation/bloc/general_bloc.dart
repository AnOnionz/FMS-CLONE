import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/usecase/clear_general_usercase.dart';
import 'package:fms/features/general/domain/usecase/create_general_usecase.dart';
import 'package:fms/features/general/domain/usecase/get_general_usecase.dart';

import 'package:fms/features/general/domain/usecase/refresh_general_usecase.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/network_time/network_time_service.dart';
import '../../domain/usecase/get_config_usecase.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final GetConfigUsecase _getConfig;
  final RefreshGeneralUseCase _refreshGeneral;
  final GetAttendanceInfoUsecase _getAttendance;
  final CreateGeneralUseCase _createGeneral;
  final ClearGeneralUseCase _clearGeneral;
  final GetGeneralUseCase _getGeneral;
  GeneralBloc(this._getConfig, this._refreshGeneral, this._getAttendance,
      this._createGeneral, this._clearGeneral, this._getGeneral)
      : super(GeneralInitial()) {
    on<GeneralFetch>((event, emit) async {
      emit(GeneralLoading());

      final execute = await _getConfig(event.workPlace);

      final config = execute.fold((failure) {
        emit(GeneralFailure(failure: failure));
        return null;
      }, (config) => config);

      if (config != null) {
        final time = await Modular.get<NetworkTimeService>().ntpDateTime();
        final GeneralEntity general = GeneralEntity(
            identifer: 'temp',
            project: event.workPlace.project!,
            outlet: event.workPlace.outlet!,
            booth: event.workPlace.booth!,
            config: config,
            createdDate: time.dMy());

        await _createGeneral(general);

        final execute = await _getAttendance();

        final attendanceInfo = execute.fold((failure) {
          emit(GeneralFailure(failure: failure));
          return null;
        }, (data) => data);
        if (attendanceInfo != null) {
          final execute = await _refreshGeneral(attendanceInfo);
          execute.fold((failure) => emit(GeneralFailure(failure: failure)),
              (data) => emit(GeneralSuccess(general: general)));
        } else {
          emit(GeneralSuccess(general: general));
        }
      }
    });
    on<GeneralStared>((event, emit) async {
      final execute = await _getGeneral();
      execute.fold((failure) => emit(GeneralFailure(failure: failure)), (data) {
        if (data == null) {
          emit(GeneralFailure());
        } else {
          emit(GeneralSuccess(general: data));
        }
      });
    }, transformer: droppable());

    on<GeneralRefresh>((event, emit) async {
      await _refreshGeneral(event.attendance);
    }, transformer: droppable());

    on<GeneralReset>((event, emit) async {
      await _clearGeneral();
    });
  }
}
