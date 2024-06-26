import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/profile/domain/usecases/get_user_info_usecase.dart';

import '../../../../core/errors/failure.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final GetUserInfoUsecase _getUserInfo;
  UserInfoCubit(this._getUserInfo) : super(UserInfoInitial());

  Future<void> getUserInfo() async {
    emit(UserInfoLoading());
    await _getUserInfo()
      ..fold((failure) => emit(UserInfoFailure(failure)),
          (data) => emit(UserInfoSuccess()));
  }
}
