part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class CreateProfile extends ProfileEvent {
  final UserProfileEntity profile;

  CreateProfile({required this.profile});
}
