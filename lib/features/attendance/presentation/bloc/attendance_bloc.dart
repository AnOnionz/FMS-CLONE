import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/attendance/domain/usecases/face_verification.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../domain/usecases/get_attendance_usecase.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceUsecase _attendance;
  final FaceVerificationUsecase _faceVerification;
  final GetAttendanceInfoUsecase _getAttendanceInfo;
  final GeneralBloc _generalBloc;

  AttendanceBloc(this._attendance, this._generalBloc, this._getAttendanceInfo,
      this._faceVerification)
      : super(AttendanceInitial()) {
    on<AttendanceEvent>(_onAttedanceUpload, transformer: droppable());
  }

  Future<void> _onAttedanceUpload(AttendanceEvent event, emit) async {
    emit(AttendanceLoading());

    final isfaceVerified = true;

    // if ((event.feature.featureAttendance!.isFaceRequired ?? false) &&
    //     event.file != null) {
    //   await _faceVerification(event.file!)
    //     ..fold((failure) {
    //       isfaceVerified = false;
    //       if (failure is! InternalFailure && failure is! SocketFailure) {
    //         emit(AttendanceFailure(FaceVerificationFailure()));
    //       } else
    //         emit(AttendanceFailure(failure));
    //     }, (data) => null);
    // }
    if (isfaceVerified) {
      final NetworkTimeService timeService = Modular.get<NetworkTimeService>();
      final time = await timeService.ntpDateTime();
      final execute = await _attendance(AttendanceParams(
        file: event.file,
        position: event.position,
        time: time,
        feature: event.feature,
      ));
      final attendance =
          execute.fold((failure) => emit(AttendanceFailure(failure)), (data) {
        if (data == null) {
          emit(AttendanceFailure(DataNullFailure()));
          return null;
        }
        return data;
      });

      if (attendance != null) {
        final execute = await _getAttendanceInfo(
            AttendanceParams(time: time, feature: event.feature));
        execute.fold((failure) => emit(AttendanceSuccess(null)), (data) {
          emit(AttendanceSuccess(data));
          if (data != null) {
            _generalBloc.add(GeneralRefresh(attendance: data));
          }
        });
      }
    }
  }
}
