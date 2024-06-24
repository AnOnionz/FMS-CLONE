import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/profile/presentation/pages/profile_edit_page.dart';

import '../../routes/routes.dart';

class ProfileModule extends Module {
  static String route = '/profile/';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => ProfileEditPage());
  }
}
