part of 'get_profile_bloc.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final UserProfileEntity profile;

  GetProfileSuccess({required this.profile});
}

final class GetProfileFailure extends GetProfileState {
  final Failure failure;

  GetProfileFailure(this.failure);
}
