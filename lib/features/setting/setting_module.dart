import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/lock/lock_module.dart';
import 'package:fms/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:fms/features/setting/presentation/pages/setting_page.dart';
import 'package:fms/features/sign/sign_module.dart';

import '../../routes/routes.dart';
import 'presentation/pages/app_lock_page.dart';
import 'presentation/pages/change_password_page.dart';

class SettingModule extends Module {
  static const String route = '/setting/';
  static const String appLock = 'applock';
  static const String changePass = 'change_pass';

  @override
  List<Module> get imports => [LockModule(), SignModule()];
  @override
  void binds(Injector i) {
    i.add<SettingCubit>(SettingCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => SettingPage(),
    );
    r.child(
      Routes.root + appLock,
      child: (_) => const AppLockPage(),
    );
    r.child(
      Routes.root + changePass,
      child: (_) => ChangePassWordPage(),
    );
  }
}
