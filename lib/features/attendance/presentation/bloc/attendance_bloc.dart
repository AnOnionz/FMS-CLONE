import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/network_time/network_time_service.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceUsecase _attendance;
  AttendanceBloc(this._attendance) : super(AttendanceInitial()) {
    on<AttendanceEvent>((event, emit) async {
      emit(AttendanceLoading());
      final NetworkTimeService timeService = Modular.get<NetworkTimeService>();
      final time = await timeService.ntpDateTime();
      final execute = await _attendance(AttendanceParams(
          feature: event.feature,
          file: event.file,
          position: event.position,
          time: time,
          general: event.general));
      execute.fold((failure) => emit(AttendanceFailure(failure)),
          (data) => emit(AttendanceSuccess()));
    });
  }
}
