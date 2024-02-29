import '/core/client/dio_client.dart';
import '/features/authentication/data/models/user_model.dart';

sealed class UserRemoteDataSource {
  Future<bool> registerWithUsernameAndPassword();
  Future<UserModel> loginWithUsernameAndPassword();
  Future<bool> logout();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  // ignore: unused_field
  final DioClient _dio;

  UserRemoteDataSourceImpl({required DioClient dio}) : _dio = dio;

  @override
  Future<UserModel> loginWithUsernameAndPassword() async {
    return UserModel(id: '123');
  }

  @override
  Future<bool> registerWithUsernameAndPassword() async {
    return true;
  }

  @override
  Future<bool> logout() async {
    return true;
  }
}
