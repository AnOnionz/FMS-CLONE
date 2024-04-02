import 'package:flutter_modular/flutter_modular.dart';

import '../features/authentication/domain/repositories/authentication_repository.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final repository = Modular.get<AuthenticationRepository>();
    return repository.isLogged;
  }
}
