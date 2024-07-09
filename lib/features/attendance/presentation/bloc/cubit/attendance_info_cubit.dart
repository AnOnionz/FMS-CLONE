import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../general/presentation/bloc/general_bloc.dart';

part 'attendance_info_state.dart';

class AttendanceInfoCubit extends Cubit<AttendanceInfoState> {
  final GetAttendanceInfoUsecase _getAttendanceInfo;
  final GeneralBloc _generalBloc;
  AttendanceInfoCubit(this._getAttendanceInfo, this._generalBloc)
      : super(AttendanceInfoInitial());

  Future<void> getInfo({required FeatureEntity feature}) async {
    emit(AttendanceInfoLoading());
    final execute = await _getAttendanceInfo(
        AttendanceParams(time: DateTime.now(), feature: feature));

    final attendanceInfo = execute.fold((failure) {
      emit(AttendanceInfoFailure(DownloadFailure()));
      return null;
    }, (data) {
      emit(AttendanceInfoSuccess(data));
      return data;
    });
    if (attendanceInfo != null) {
      _generalBloc.add(GeneralRefresh(attendance: attendanceInfo));
    }
  }
}
