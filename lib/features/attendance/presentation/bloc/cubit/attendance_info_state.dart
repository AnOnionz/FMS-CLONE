part of 'attendance_info_cubit.dart';

sealed class AttendanceInfoState extends Equatable {
  const AttendanceInfoState();

  @override
  List<Object> get props => [];
}

final class AttendanceInfoInitial extends AttendanceInfoState {}

final class AttendanceInfoLoading extends AttendanceInfoState {}

final class AttendanceInfoSuccess extends AttendanceInfoState {
  final AttendanceEntity? info;

  AttendanceInfoSuccess(this.info);

  @override
  String toString() {
    return 'AttendanceInfoSuccess($info)';
  }
}

final class AttendanceInfoFailure extends AttendanceInfoState {
  final Failure failure;

  AttendanceInfoFailure(this.failure);
}
