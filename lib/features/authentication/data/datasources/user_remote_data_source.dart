import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/constant/keys.dart';
import '/features/authentication/data/models/user_model.dart';

sealed class UserRemoteDataSource {
  Future<bool> registerWithUsernameAndPassword();
  Future<UserModel?> loginWithUsernameAndPassword();
  Future<bool> logout();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final auth0 =
      Auth0(dotenv.env[Keys.AUTH0_DOMAIN]!, dotenv.env[Keys.AUTH0_CLIENT_ID]!);
  @override
  Future<UserModel?> loginWithUsernameAndPassword() async {
    try {
      final credentials = await auth0
          .webAuthentication(scheme: dotenv.env[Keys.AUTH0_CUSTOM_SCHEME]!)
          .login(
              useHTTPS: true,
              parameters: {
                'prompt': 'login',
              },
              useEphemeralSession: true);
      return UserModel.fromCredentials(credentials);
    } on WebAuthenticationException catch (_) {
      return null;
    }
  }

  @override
  Future<bool> registerWithUsernameAndPassword() async {
    return true;
  }

  @override
  Future<bool> logout() async {
    try {
      await auth0
          .webAuthentication(scheme: dotenv.env[Keys.AUTH0_CUSTOM_SCHEME]!)
          .logout();
      return true;
    } on WebAuthenticationException catch (_) {
      return false;
    }
  }
}
