import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/constant/keys.dart';

sealed class UserRemoteDataSource {
  Future<Credentials?> login();
  Future<void> logout();
  Future<UserProfile> userProfile(String accessToken);
  Future<Credentials> renewCredentials(String refreshToken);
  Future<Credentials> credentials();
  Future<bool> hasValidCredentials();
  Future<void> changePassword(String email);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final auth0 =
      Auth0(dotenv.env[Keys.AUTH0_DOMAIN]!, dotenv.env[Keys.AUTH0_CLIENT_ID]!);

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
  Future<void> changePassword(String email) async {
    await auth0.api.resetPassword(
        email: email, connection: 'Username-Password-Authentication');
  }

  @override
  Future<Credentials> credentials() {
    return auth0.credentialsManager.credentials();
  }

  @override
  Future<bool> hasValidCredentials() {
    return auth0.credentialsManager.hasValidCredentials();
  }

  @override
  Future<Credentials?> login() async {
    try {
      return auth0
          .webAuthentication(scheme: dotenv.env[Keys.AUTH0_CUSTOM_SCHEME]!)
          .login(
              audience: 'https://ocs-demo.ocs.com',
              parameters: {
                'prompt': 'login',
              },
              useEphemeralSession: true);
    } on WebAuthenticationException catch (_) {
      return null;
    }
  }

  @override
  Future<Credentials> renewCredentials(String refreshToken) {
    return auth0.api.renewCredentials(refreshToken: refreshToken);
  }

  @override
  Future<UserProfile> userProfile(String accessToken) {
    return auth0.api.userProfile(accessToken: accessToken);
  }
}
