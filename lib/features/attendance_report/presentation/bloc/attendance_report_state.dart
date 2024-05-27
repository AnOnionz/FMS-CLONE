part of 'attendance_report_bloc.dart';

abstract class AttendanceReportState extends Equatable {
  const AttendanceReportState();

  @override
  List<Object> get props => [];
}

class AttendanceReportInitial extends AttendanceReportState {}

class AttendanceReportLoading extends AttendanceReportState {}

class AttendanceReportSuccess extends AttendanceReportState {
  final List<AttendanceEntity> entities;

  AttendanceReportSuccess(this.entities);
}

class AttendanceReportFailure extends AttendanceReportState {
  final Failure failure;

  AttendanceReportFailure(this.failure);
}
