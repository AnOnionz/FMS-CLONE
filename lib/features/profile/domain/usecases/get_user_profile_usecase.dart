import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/profile_repository_impl.dart';

class GetUserProfileUsecase extends UseCase<UserProfileEntity?, void> {
  final ProfileRepositoryImpl _repository;

  GetUserProfileUsecase(this._repository);
  @override
  Future<Result<UserProfileEntity?>> call([void params]) async {
    return _repository.getUserProfile();
  }
}
