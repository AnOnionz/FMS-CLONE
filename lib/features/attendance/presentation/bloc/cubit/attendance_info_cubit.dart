import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_usecase.dart';

import '../../../../config/domain/entities/config_entity.dart';
import '../../../../general/domain/entities/general_entity.dart';

part 'attendance_info_state.dart';

class AttendanceInfoCubit extends Cubit<AttendanceInfoState> {
  final GetAttendanceInfoUsecase _getAttendanceInfo;

  AttendanceInfoCubit(this._getAttendanceInfo) : super(AttendanceInfoInitial());

  Future<void> getInfo(
      {required Feature feature, required GeneralEntity general}) async {
    emit(AttendanceInfoLoading());
    final execute = await _getAttendanceInfo(AttendanceParams(
        time: DateTime.now(), feature: feature, general: general));

    execute.fold((failure) => emit(AttendanceInfoFailure(failure)), (data) {
      emit(AttendanceInfoSuccess(data));
    });
  }
}
