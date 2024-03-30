import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class HasValidCredentialsUsecase extends UseCase<bool, void> {
  final UserRepository repository;

  HasValidCredentialsUsecase({required this.repository});
  @override
  Future<Result<bool>> call([void params]) async {
    return repository.hasValidCredentials();
  }
}
