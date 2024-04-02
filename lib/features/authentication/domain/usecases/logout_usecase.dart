import '../repositories/authentication_repository.dart';
import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';

class LogoutUsecase extends UseCase<void, void> {
  final AuthenticationRepository repository;

  LogoutUsecase({required this.repository});
  @override
  Future<Result<void>> call([void params]) async {
    return repository.logout();
  }
}
