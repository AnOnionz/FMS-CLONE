import 'dart:async';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:fms/core/errors/app_exception.dart';
import 'package:fms/features/authentication/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '/core/client/dio_client.dart';
import '/core/constant/type_def.dart';
import '/core/repository/repository.dart';
import '/core/usecase/either.dart';
import '/features/authentication/domain/entities/user_entity.dart';
import '/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  UserEntity? get user => _user;

  UserRepositoryImpl(
      {required UserRemoteDataSource remote,
      required UserLocalDataSource local,
      required DioClient client})
      : _local = local,
        _remote = remote,
        _client = client;

  @override
  Future<Result<bool>> loginWithAuth0() async {
    return todo(() async {
      final user = await _remote.loginWithAuth0();
      if (user != null) {
        _user = user;
        _local.cacheUserData(user);
        _local.cacheToken(user.accessToken);
        _client.setBearerAuth(token: user.tokenType + user.accessToken);
        await Future.delayed(const Duration(milliseconds: 111),
            () => _controller.add(AuthenticationStatus.authenticated));
      } else {
        return Right(false);
      }
      return Right(true);
    });
  }

  @override
  Future<Result<bool>> renew() async {
    return todo(() async {
      final user = await _remote.renew(_user!.refreshToken!);
      if (user != null) {
        _user = user;
        _updateUser(user);
        return Right(true);
      }
      return Right(false);
    });
  }

  @override
  Future<Result<bool>> logout() async {
    _user = null;
    _updateUser(null);
    _controller.add(AuthenticationStatus.unauthenticated);
    return Right(true);
  }

  @override
  Future<Result<bool>> registerWithUsernameAndPassword(
      {required String username, required String password}) async {
    return todo(() async {
      await _remote.register();
      return Right(true);
    });
  }

  @override
  Future<Result<bool>> changePasswordWithAuth0() {
    return todo(() async {
      if (_user!.email == null) {
        return Left(
            MessageFailure(message: 'Tài khoản chưa được cập nhật email'));
      }
      await _remote.changePassword(_user!.email!);
      return Right(true);
    });
  }

  void _updateUser(UserModel? user) {
    if (user == null) {
      _local.clearUserData();
      _local.clearToken();
      _client.clearBearerAuth();
    } else {
      _local.cacheUserData(user);
      _local.cacheToken(user.accessToken);
      _client.setBearerAuth(token: user.tokenType + user.accessToken);
    }
  }

  @override
  bool get isLogged => _local.isLogin;

  @override
  Stream<AuthenticationStatus> get status async* {
    final user = _local.getUserFromLocal();
    if (user == null)
      yield AuthenticationStatus.unauthenticated;
    else {
      _user = user;
      _client.setBearerAuth(token: _local.getTokenFromLocal()!);
      yield AuthenticationStatus.authenticated;
    }

    yield* _controller.stream;
  }

  @override
  void dispose() => _controller.close();

  final UserRemoteDataSource _remote;
  final UserLocalDataSource _local;
  final DioClient _client;
  final _controller = StreamController<AuthenticationStatus>();
  UserEntity? _user;
}
