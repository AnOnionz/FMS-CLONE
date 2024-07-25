import 'dart:io';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:fms/core/mixins/common.dart';

import '../../../../core/constant/keys.dart';
import '../../../../core/environment/env.dart';

sealed class AuthenticationRemoteDataSource {
  Future<Credentials?> login();
  Future<bool> logout();
  Future<UserProfile> userProfile(String accessToken);
  Future<Credentials> renewCredentials(String refreshToken);
  Future<Credentials> credentials();
  Future<bool> hasValidCredentials();
  Future<void> changePassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  late final Auth0 auth0 = Auth0(
    env.variables[Keys.AUTH0_DOMAIN] as String,
    env.variables[Keys.AUTH0_CLIENT_ID] as String,
  );
  late final WebAuthentication webAuthentication = auth0.webAuthentication(
      scheme: env.variables[Keys.AUTH0_CUSTOM_SCHEME] as String);

  final connection = 'Username-Password-Authentication';

  @override
  Future<bool> logout() async {
    try {
      await webAuthentication.logout();
      // await auth0.credentialsManager.clearCredentials();
      return true;
    } on WebAuthenticationException catch (_) {
      return false;
    }
  }

  @override
  Future<void> changePassword(String email) async {
    await auth0.api.resetPassword(email: email, connection: connection);
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
      final credentials = await webAuthentication.login(
          audience: 'https://ocs-demo.ocs.com',
          // audience: 'https://fms.outcome.asia',
          parameters: {
            'prompt': 'login',
          },
          useEphemeralSession: Platform.isIOS);

      return credentials;
    } on WebAuthenticationException catch (e) {
      Fx.log(e);
      return null;
    }
  }

  @override
  Future<Credentials> renewCredentials(String refreshToken) async {
    final newCredentials =
        await auth0.api.renewCredentials(refreshToken: refreshToken);

    return newCredentials;
  }

  @override
  Future<UserProfile> userProfile(String accessToken) {
    return auth0.api.userProfile(accessToken: accessToken);
  }
}
