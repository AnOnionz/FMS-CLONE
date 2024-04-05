import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance/attendance_in_module.dart';
import 'package:fms/features/attendance/domain/entities/feature_entity.dart';

part 'attendance_flow_state.dart';

class AttendanceFlowCubit extends Cubit<AttendanceFlowState> {
  AttendanceFlowCubit() : super(AttendanceFlowInitial());

  void attendanceStarted(FeatureEntity entity) {
    switch (entity.feature.featureAttendance!.isLocationRequired) {
      case true:
        Modular.to.pushNamed(AttendanceInModule.locate, arguments: entity);
        break;
      default:
        Modular.to.pushNamed(AttendanceInModule.attendance, arguments: entity);
    }
  }
}
