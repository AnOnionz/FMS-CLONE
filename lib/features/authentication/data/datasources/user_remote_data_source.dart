import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/constant/keys.dart';
import '/features/authentication/data/models/user_model.dart';

sealed class UserRemoteDataSource {
  Future<bool> register();
  Future<UserModel?> loginWithAuth0();
  Future<void> changePassword(String email);
  Future<UserModel?> renew(String refreshToken);
  Future<bool> logout();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final auth0 =
      Auth0(dotenv.env[Keys.AUTH0_DOMAIN]!, dotenv.env[Keys.AUTH0_CLIENT_ID]!);
  @override
  Future<UserModel?> loginWithAuth0() async {
    try {
      final credentials = await auth0
          .webAuthentication(scheme: dotenv.env[Keys.AUTH0_CUSTOM_SCHEME]!)
          .login(
              // useHTTPS: true,
              parameters: {
            'prompt': 'login',
          },
              useEphemeralSession: true);
      return UserModel.fromCredentials(credentials);
    } on WebAuthenticationException catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> register() async {
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

  @override
  Future<UserModel?> renew(String refreshToken) async {
    try {
      final credentials =
          await auth0.api.renewCredentials(refreshToken: refreshToken);
      return UserModel.fromCredentials(credentials);
    } on WebAuthenticationException catch (_) {
      return null;
    }
  }

  @override
  Future<void> changePassword(String email) async {
    await auth0.api.resetPassword(
        email: email, connection: 'Username-Password-Authentication');
  }
}
