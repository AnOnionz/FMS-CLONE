import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class LogoutUsecase extends UseCase<void, void> {
  final UserRepository repository;

  LogoutUsecase({required this.repository});
  @override
  Future<Result<void>> call([void params]) async {
    return repository.logout();
  }
}
