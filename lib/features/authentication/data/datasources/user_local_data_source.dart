import '/core/constant/keys.dart';
import '/core/database/database.dart';
import '/features/authentication/domain/entities/user_entity.dart';

sealed class UserLocalDataSource {
  bool get isLogin;
  void cacheUserData(UserEntity user);
  void clearUserData();
  void cacheToken(String token);
  void clearToken();
  UserEntity? getUserFromLocal();
  String? getTokenFromLocal();
  List<UserEntity> getAllUserData();
  void clearAllUserData();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  bool get isLogin => getUserFromLocal() != null;
  final database = Database();

  @override

  /// get existing user if id cached not null
  UserEntity? getUserFromLocal() {
    final id = database.getValue(Keys.CURRENT_USER_ID);
    if (id == null) return null;
    final UserEntity? user = database.getObject(id: int.parse(id));

    return user;
  }

  @override
  void cacheUserData(UserEntity user) {
    final id = database.addObject(user);
    database.setValue(Keys.CURRENT_USER_ID, id.toString());
  }

  @override
  void cacheToken(String token) {
    database.setValue(Keys.TOKEN, token);
  }

  @override
  String? getTokenFromLocal() {
    return database.getValue(Keys.TOKEN);
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
    database.setValue(Keys.TOKEN, null);
  }
}
