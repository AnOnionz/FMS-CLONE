part of 'attendance_report_bloc.dart';

abstract class AttendanceReportEvent {
  const AttendanceReportEvent();
}

class GetData extends AttendanceReportEvent {}
