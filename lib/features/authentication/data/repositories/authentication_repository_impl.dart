import 'dart:async';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:fms/core/client/dio_client.dart';
import 'package:fms/features/profile/data/datasources/profile_local_datasource.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '/core/constant/type_def.dart';
import '/core/repository/repository.dart';
import '/core/usecase/either.dart';

class AuthenticationRepositoryImpl extends Repository
    implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._profileLocal,
      {required AuthenticationRemoteDataSource remote,
      required AuthenticationLocalDataSource local,
      required DioClient dio})
      : _remote = remote,
        _local = local,
        _dio = dio;

  @override
  Credentials? get credentials => _credentials;

  @override
  Future<Result<Credentials?>> login() async {
    return todo(() async {
      final credentials = await _remote.login();
      _credentials = credentials;
      if (credentials != null) {
        _profileLocal.clearUser();
        _local.cacheRefreshToken(credentials.refreshToken!);
        _local.cacheIdentifier(credentials.user.sub);
        _dio.setBearerAuth(
            token: credentials.tokenType +
                ' ' +
                credentials.accessToken.toString());
      }
      return Right(credentials);
    });
  }

  @override
  Future<Result<Credentials>> renewCredentials() async {
    return todo(() async {
      final refreshToken = _local.getRefreshToken();
      if (refreshToken == null) {
        return Left(DataNullFailure());
      }
      final credentials = await _remote.renewCredentials(refreshToken);
      _credentials = credentials;
      _dio.setBearerAuth(
          token: credentials.tokenType + ' ' + credentials.accessToken);
      return Right(credentials);
    });
  }

  @override
  Future<Result<bool>> logout() async {
    final success = await _remote.logout();
    return Right(success);
  }

  @override
  Result<bool> logoutSuccess() {
    _credentials = null;
    _local.clearToken();
    _dio.clearBearerAuth();
    _profileLocal.clearUser();
    return Right(true);
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
  Future<Result<Credentials>> getCredentials() {
    return todo(() async {
      try {
        final credentials = await _remote.credentials();
        _credentials = credentials;
        _local.cacheRefreshToken(credentials.refreshToken!);
        _local.cacheIdentifier(credentials.user.sub);
        _dio.setBearerAuth(
            token: credentials.tokenType + ' ' + credentials.accessToken);
        return Right(credentials);
      } on CredentialsManagerException catch (_) {
        final refreshToken = _local.getRefreshToken();
        if (refreshToken != null) {
          final newCredentials = await _remote.renewCredentials(refreshToken);
          _credentials = newCredentials;
          _dio.setBearerAuth(
              token:
                  newCredentials.tokenType + ' ' + newCredentials.accessToken);
          return Right(newCredentials);
        }
        rethrow;
      }
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

  @override
  bool get isLogged => _credentials != null;

  final AuthenticationRemoteDataSource _remote;
  final AuthenticationLocalDataSource _local;
  final DioClient _dio;
  final ProfileLocalDataSource _profileLocal;
  Credentials? _credentials;
}
