import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';
import 'package:fms/features/profile/domain/usecases/create_profile_usecase.dart';

import '../../../../core/errors/failure.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CreateUserProfileUsecase _createUserProfile;

  ProfileBloc(this._createUserProfile) : super(ProfileInitial()) {
    on<CreateProfile>((event, emit) async {
      emit(ProfileLoading());
      await _createUserProfile(CreateUserProfileParams(
          userProfile: event.profile, projectId: event.projectId))
        ..fold((failure) => emit(ProfileFailure(failure)),
            (data) => emit(ProfileSuccess(data)));
    });
  }
}
