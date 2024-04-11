import 'package:fms/features/authentication/data/models/user_model.dart';

import '/core/constant/keys.dart';
import '/core/database/database.dart';
import '/features/authentication/domain/entities/user_entity.dart';

sealed class AuthenticationLocalDataSource {
  bool get isLogin;
  void cacheUserData(UserModel user);
  void clearUserData();
  void cacheRefreshToken(String token);
  void clearToken();
  UserEntity? getUserFromLocal();
  String? getRefreshTokenFromLocal();
  List<UserEntity> getAllUserData();
  void clearAllUserData();
}

class AuthLocalDataSourceImpl implements AuthenticationLocalDataSource {
  final database = Database.instance;
  @override
  bool get isLogin => getUserFromLocal() != null;

  @override

  /// get existing user if id cached not null
  UserEntity? getUserFromLocal() {
    final id = database.getValue(Keys.CURRENT_USER_ID);
    if (id == null) return null;
    final UserEntity? user = database.getObject<UserModel>(id: int.parse(id));

    return user;
  }

  @override
  void cacheUserData(UserModel user) {
    final id = database.addObject<UserModel>(user);
    database.setValue(Keys.CURRENT_USER_ID, id.toString());
  }

  @override
  void cacheRefreshToken(String token) {
    database.setValue(Keys.REFRESH_TOKEN, token);
  }

  @override
  String? getRefreshTokenFromLocal() {
    return database.getValue(Keys.REFRESH_TOKEN);
  }

  @override
  List<UserEntity> getAllUserData() {
    return database.getObjects();
  }

  @override
  void clearAllUserData() {
    database.deleteCollection<UserEntity>();
  }

  @override
  void clearUserData() {
    database.setValue(Keys.CURRENT_USER_ID, null);
  }

  @override
  void clearToken() {
    database.setValue(Keys.REFRESH_TOKEN, null);
  }
}
