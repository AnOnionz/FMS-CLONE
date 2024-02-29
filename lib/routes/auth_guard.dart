import 'package:flutter_modular/flutter_modular.dart';

import '../features/authentication/domain/repositories/user_repository.dart';
import '../routes/routes.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: Routes.login);

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final repository = Modular.get<UserRepository>();
    return repository.isLogged;
  }
}
