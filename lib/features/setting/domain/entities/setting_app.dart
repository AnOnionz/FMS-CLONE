// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'setting_app.g.dart';

@collection
class SettingApp {
  Id? id;
  bool cameraCustom;
  SettingApp({
    this.id,
    this.cameraCustom = false,
  });

  @override
  String toString() => 'SettingApp(id: $id, cameraCustom: $cameraCustom)';

  SettingApp copyWith({
    Id? id,
    bool? cameraCustom,
  }) {
    return SettingApp(
      id: id ?? this.id,
      cameraCustom: cameraCustom ?? this.cameraCustom,
    );
  }
}
