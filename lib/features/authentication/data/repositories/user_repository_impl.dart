import 'dart:async';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:fms/core/client/dio_client.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/user_remote_data_source.dart';
import '/core/constant/type_def.dart';
import '/core/repository/repository.dart';
import '/core/usecase/either.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required UserRemoteDataSource remote, required DioClient dio})
      : _remote = remote,
        _dio = dio;

  @override
  Credentials? get user => _credentials;

  @override
  Future<Result<Credentials?>> login() async {
    return todo(() async {
      final credentials = await _remote.login();
      _credentials = credentials;
      _dio.setBearerAuth(
          token: credentials!.tokenType +
              ' ' +
              credentials.accessToken.toString());
      return Right(user);
    });
  }

  @override
  Future<Result<bool>> renewCredentials() async {
    return todo(() async {
      final credentials =
          await _remote.renewCredentials(_credentials!.refreshToken!);
      _credentials = credentials;
      _dio.setBearerAuth(
          token: credentials.tokenType + ' ' + credentials.accessToken);
      return Right(true);
    });
  }

  @override
  Future<Result<void>> logout() async {
    await _remote.logout();
    _credentials = null;
    _dio.clearBearerAuth();
    return Right(Never);
  }

  @override
  Future<Result<void>> changePassword() {
    return todo(() async {
      if (_credentials!.user.email == null) {
        return Left(
            MessageFailure(message: 'Tài khoản chưa được cập nhật email'));
      }
      await _remote.changePassword(_credentials!.user.email!);
      return Right(Never);
    });
  }

  @override
  bool get isLogged => _credentials != null;

  final UserRemoteDataSource _remote;
  final DioClient _dio;
  Credentials? _credentials;

  @override
  Future<Result<Credentials>> credentials() {
    return todo(() async {
      final credentials = await _remote.credentials();
      _credentials = credentials;
      _dio.setBearerAuth(
          token: credentials.tokenType + ' ' + credentials.accessToken);
      return Right(credentials);
    });
  }

  @override
  Future<Result<bool>> hasValidCredentials() {
    return todo(() async {
      final check = await _remote.hasValidCredentials();
      return Right(check);
    });
  }

  @override
  Future<Result<UserProfile>> userProfile(String accessToken) {
    return todo(() async {
      final userProfile = await _remote.userProfile(accessToken);
      return Right(userProfile);
    });
  }
}
