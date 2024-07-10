import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../data/repositories/profile_repository_impl.dart';

class CreateUserProfileUsecase
    extends UseCase<UserProfileEntity, CreateUserProfileParams> {
  final ProfileRepositoryImpl _repository;

  CreateUserProfileUsecase(this._repository);
  @override
  Future<Result<UserProfileEntity>> call(CreateUserProfileParams params) async {
    return _repository.createUserProfile(
        userProfile: params.userProfile, projectId: params.projectId);
  }
}

class CreateUserProfileParams extends Params {
  final UserProfileEntity userProfile;
  final int projectId;

  CreateUserProfileParams({required this.userProfile, required this.projectId});
}
