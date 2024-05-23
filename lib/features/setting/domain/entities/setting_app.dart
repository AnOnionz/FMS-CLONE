import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';

part 'setting_app.g.dart';

@collection
class SettingApp {
  Id? id;
  bool useCameraZ;
  AppLock appLock;
  SettingApp({this.id, this.useCameraZ = false, required this.appLock});

  @override
  String toString() => 'SettingApp(id: $id, cameraCustom: $useCameraZ)';

  SettingApp copyWith({
    Id? id,
    bool? cameraCustom,
    AppLock? appLock,
  }) {
    return SettingApp(
        id: id ?? this.id,
        useCameraZ: cameraCustom ?? this.useCameraZ,
        appLock: appLock ?? this.appLock);
  }
}

@embedded
class AppLock {
  bool? isPasswordSet;
  bool? isLocalAuth;
  String? password;

  AppLock(
      {this.isPasswordSet = false, this.isLocalAuth = false, this.password});

  AppLock crypto(String data) {
    final code = md5.convert(data.codeUnits);
    return AppLock(
        isLocalAuth: isLocalAuth,
        isPasswordSet: isPasswordSet,
        password: code.toString());
  }

  @override
  String toString() =>
      'AppLock(isPasswordSet: $isPasswordSet, isLocalAuth: $isLocalAuth)';

  AppLock copyWith({
    bool? isPasswordSet,
    bool? isLocalAuth,
  }) {
    return AppLock(
        isPasswordSet: isPasswordSet ?? this.isPasswordSet,
        isLocalAuth: isLocalAuth ?? this.isLocalAuth,
        password: password);
  }
}
