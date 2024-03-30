import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_report_event.dart';
part 'attendance_report_state.dart';

class AttendanceReportBloc
    extends Bloc<AttendanceReportEvent, AttendanceReportState> {
  AttendanceReportBloc() : super(AttendanceReportInitial()) {
    on<AttendanceReportEvent>((event, emit) {});
  }
}
