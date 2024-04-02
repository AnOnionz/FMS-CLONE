import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/sign/sign_module.dart';

import '../../routes/routes.dart';
import '../config/config_module.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  static const String route = '/home/';
  @override
  List<Module> get imports => [SignModule(), ConfigModule()];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => HomePage(),
    );
  }
}
