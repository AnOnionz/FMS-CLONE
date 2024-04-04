import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';

import '/core/constant/type_def.dart';

export '../../data/repositories/authentication_repository_impl.dart';

abstract class AuthenticationRepository {
  Credentials? get credentials;
  bool get isLogged;
  Future<Result<Credentials?>> login();
  Future<Result<void>> changePassword();
  Future<Result<bool>> renewCredentials();
  Future<Result<UserProfile>> userProfile(String accessToken);
  Future<Result<Credentials>> getCredentials();
  Future<Result<bool>> hasValidCredentials();
  Future<Result<bool>> logout();
}
