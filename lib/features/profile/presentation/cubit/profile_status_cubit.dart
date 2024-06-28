import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/profile/domain/entities/profile_status_entity.dart';
import 'package:fms/features/profile/domain/usecases/get_profile_status_usecase.dart';

part 'profile_status_state.dart';

class ProfileStatusCubit extends Cubit<ProfileStatusState> {
  final GetProfileStatusUsecase _getProfileStatus;
  ProfileStatusCubit(this._getProfileStatus) : super(ProfileStatusInitial());

  Future<void> getProfileStatus() async {
    emit(ProfileStatusLoading());
    await _getProfileStatus()
      ..fold((failure) => emit(ProfileStatusFailure(failure)),
          (data) => emit(ProfileStatusSuccess(entity: data)));
  }
}
