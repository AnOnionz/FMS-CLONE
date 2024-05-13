import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../../attendance_core_module.dart';

part 'attendance_flow_state.dart';

class AttendanceFlowCubit extends Cubit<AttendanceFlowState> {
  AttendanceFlowCubit() : super(AttendanceFlowInitial());

  void attendanceStarted(GeneralFeatureData entity) {
    switch (entity.feature.featureAttendance!.isLocationRequired) {
      case true:
        Modular.to.pushReplacementNamed(AttendanceCoreModule.locate,
            arguments: entity);
        break;
      default:
        Modular.to.pushReplacementNamed(AttendanceCoreModule.attendance,
            arguments: entity);
    }
  }
}
