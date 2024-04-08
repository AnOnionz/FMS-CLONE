part of 'attendance_bloc.dart';

sealed class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceSuccess extends AttendanceState {
  final AttendanceData attendanceData;

  AttendanceSuccess(this.attendanceData);
}

final class AttendanceFailure extends AttendanceState {
  final Failure failure;

  AttendanceFailure(this.failure);
}
