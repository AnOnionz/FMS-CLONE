import 'package:auth0_flutter/auth0_flutter.dart';

import '../repositories/authentication_repository.dart';
import '/core/constant/type_def.dart';
import '/core/usecase/usecase.dart';

class GetCredentialsUsecase extends UseCase<Credentials, void> {
  final AuthenticationRepository repository;

  GetCredentialsUsecase({required this.repository});
  @override
  Future<Result<Credentials>> call([void params]) async {
    return repository.getCredentials();
  }
}
