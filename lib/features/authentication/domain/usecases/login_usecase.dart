import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class LoginUsecase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  LoginUsecase({required this.repository});
  @override
  Future<Result<bool>> call(NoParams params) async {
    return repository.loginWithAuth0();
  }
}
