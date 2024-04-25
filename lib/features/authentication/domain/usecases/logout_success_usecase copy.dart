import '../repositories/authentication_repository.dart';
import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';

class LogoutSuccessUsecase extends UseCase<bool, void> {
  final AuthenticationRepository repository;

  LogoutSuccessUsecase({required this.repository});
  @override
  Future<Result<bool>> call([void params]) async {
    return repository.logoutSuccess();
  }
}
