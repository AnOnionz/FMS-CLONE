part of 'attendance_report_bloc.dart';

abstract class AttendanceReportEvent {
  const AttendanceReportEvent();
}

class FetchAttendanceReports extends AttendanceReportEvent {
  final FeatureEntity feature;

  FetchAttendanceReports({required this.feature});
}
