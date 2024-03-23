// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final SettingApp settings;
  static final Database database = Database();
  SettingState({required this.settings});

  factory SettingState.initial() {
    final settingApp = database.getObject<SettingApp>();
    if (settingApp == null) {
      final s = SettingApp();
      database.addObject<SettingApp>(s);
      return SettingState(settings: s);
    }

    return SettingState(settings: settingApp);
  }

  SettingState cameraToggle() {
    final newSettings = settings.copyWith(cameraCustom: !settings.cameraCustom);
    database.addObject<SettingApp>(newSettings);
    return copyWith(settings: newSettings);
  }

  @override
  List<Object> get props => [settings];

  SettingState copyWith({
    SettingApp? settings,
  }) {
    return SettingState(
      settings: settings ?? this.settings,
    );
  }
}
