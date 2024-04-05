part of 'attendance_flow_cubit.dart';

sealed class AttendanceFlowState extends Equatable {
  const AttendanceFlowState();

  @override
  List<Object> get props => [];
}

final class AttendanceFlowInitial extends AttendanceFlowState {}
