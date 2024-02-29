import 'dart:async';

import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '/core/client/dio_client.dart';
import '/core/constant/type_def.dart';
import '/core/mixins/fx.dart';
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
  Future<Result<bool>> loginWithUsernameAndPassword(
      {required String username, required String password}) async {
    return todo(() async {
      final user = await _remote.loginWithUsernameAndPassword();
      _user = user;
      _local.cacheUserData(user);
      _local.cacheToken('token');
      _client.setBearerAuth(token: 'token');
      await Future.delayed(const Duration(milliseconds: 222),
          () => _controller.add(AuthenticationStatus.authenticated));
      return Right(true);
    });
  }

  @override
  Future<Result<bool>> logout() async {
    _user = null;
    _local.clearUserData();
    _local.clearToken();
    _client.clearBearerAuth();
    _controller.add(AuthenticationStatus.unauthenticated);
    return Right(true);
  }

  @override
  Future<Result<bool>> registerWithUsernameAndPassword(
      {required String username, required String password}) async {
    return todo(() async {
      await _remote.registerWithUsernameAndPassword();
      return Right(true);
    });
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
