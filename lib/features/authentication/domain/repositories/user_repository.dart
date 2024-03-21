import 'dart:async';

import '/core/constant/type_def.dart';
import '/features/authentication/domain/entities/user_entity.dart';

export '../../data/repositories/user_repository_impl.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class UserRepository {
  Stream<AuthenticationStatus> get status;
  UserEntity get user;
  bool get isLogged;
  Future<Result<bool>> registerWithUsernameAndPassword(
      {required String username, required String password});
  Future<Result<bool>> loginWithUsernameAndPassword(
      {required String username, required String password});
  Future<Result<bool>> logout();
  void dispose();
}
