import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/app_information/presentation/cubit/app_information_cubit.dart';

import '../../routes/core_module.dart';
import 'presentation/pages/app_information_page.dart';

class AppInfomationModule extends Module {
  static const String route = '/app_info/';
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(AppInformationCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => AppInformationPage());
  }
}
