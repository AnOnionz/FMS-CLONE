import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class LoginUsecase extends UseCase<bool, LoginParams> {
  final UserRepository repository;

  LoginUsecase({required this.repository});
  @override
  Future<Result<bool>> call(LoginParams params) async {
    return repository.loginWithUsernameAndPassword(
        username: params.password, password: params.password);
  }
}

class LoginParams extends Params {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}
