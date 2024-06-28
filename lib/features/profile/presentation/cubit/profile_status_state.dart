part of 'profile_status_cubit.dart';

sealed class ProfileStatusState extends Equatable {
  const ProfileStatusState();

  @override
  List<Object> get props => [];
}

final class ProfileStatusInitial extends ProfileStatusState {}

final class ProfileStatusLoading extends ProfileStatusState {}

final class ProfileStatusSuccess extends ProfileStatusState {
  final ProfileStatusEntity? entity;

  ProfileStatusSuccess({required this.entity});
}

final class ProfileStatusFailure extends ProfileStatusState {
  final Failure failure;

  ProfileStatusFailure(this.failure);
}
