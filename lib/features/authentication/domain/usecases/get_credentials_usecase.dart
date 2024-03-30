import 'package:auth0_flutter/auth0_flutter.dart';

import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class GetCredentialsUsecase extends UseCase<Credentials, void> {
  final UserRepository repository;

  GetCredentialsUsecase({required this.repository});
  @override
  Future<Result<Credentials>> call([void params]) async {
    return repository.credentials();
  }
}
