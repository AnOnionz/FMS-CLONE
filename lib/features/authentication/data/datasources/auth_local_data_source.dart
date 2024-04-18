import 'package:fms/core/data_source/local_data_source.dart';

import '/core/constant/keys.dart';

sealed class AuthenticationLocalDataSource {
  void cacheRefreshToken(String token);
  void cacheIdentifier(String identifier);
  void clearToken();
  String? getRefreshToken();
  String? getIdentifier();
}

class AuthLocalDataSourceImpl
    with LocalDatasource
    implements AuthenticationLocalDataSource {
  @override
  void cacheRefreshToken(String token) {
    db.setValue(Keys.REFRESH_TOKEN, token);
  }

  @override
  String? getRefreshToken() {
    return db.getValue(Keys.REFRESH_TOKEN);
  }

  @override
  void clearToken() {
    db.setValue(Keys.REFRESH_TOKEN, null);
  }

  @override
  void cacheIdentifier(String identifier) {
    db.setValue(Keys.IDENTIFER, identifier);
  }

  @override
  String? getIdentifier() {
    return db.getValue(Keys.IDENTIFER);
  }
}
