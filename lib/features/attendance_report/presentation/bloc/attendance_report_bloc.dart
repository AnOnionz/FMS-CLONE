import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';

part 'attendance_report_event.dart';
part 'attendance_report_state.dart';

class AttendanceReportBloc
    extends Bloc<AttendanceReportEvent, AttendanceReportState> {
  AttendanceReportBloc() : super(AttendanceReportInitial()) {
    on<GetData>((event, emit) async {});
  }
}
