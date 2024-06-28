part of 'user_info_cubit.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoSuccess extends UserInfoState {
  final EmployeeEntity entity;

  UserInfoSuccess({required this.entity});
}

final class UserInfoFailure extends UserInfoState {
  final Failure failure;

  UserInfoFailure(this.failure);
}
