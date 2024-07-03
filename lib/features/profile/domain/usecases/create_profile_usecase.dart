import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../data/repositories/profile_repository_impl.dart';

class CreateUserProfileUsecase
    extends UseCase<UserProfileEntity, UserProfileEntity> {
  final ProfileRepositoryImpl _repository;

  CreateUserProfileUsecase(this._repository);
  @override
  Future<Result<UserProfileEntity>> call(UserProfileEntity params) async {
    return _repository.createUserProfile(userProfile: params);
  }
}
