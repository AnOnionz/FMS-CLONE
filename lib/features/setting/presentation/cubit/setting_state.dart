part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final SettingApp settings;

  SettingState({required this.settings});

  factory SettingState.initial() {
    final database = Database.instance;
    final settingApp = database.getObject<SettingApp>();
    if (settingApp == null) {
      final s = SettingApp(appLock: AppLock());
      database.addObject<SettingApp>(s);
      return SettingState(settings: s);
    }

    return SettingState(settings: settingApp);
  }

  SettingState cameraToggle() {
    final newSettings = settings.copyWith(cameraCustom: !settings.useCameraZ);
    Database.instance.addObject<SettingApp>(newSettings);
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
