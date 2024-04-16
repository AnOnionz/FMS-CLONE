import 'package:flutter_modular/flutter_modular.dart';

import 'package:fms/features/sign/presentation/bloc/sign_bloc.dart';
import 'package:fms/features/sign/presentation/pages/login_page.dart';

import '../../routes/routes.dart';
import '../authentication/authentication_module.dart';

class SignModule extends Module {
  static String route = '/login/';

  @override
  List<Module> get imports => [AuthenticationModule()];

  @override
  void binds(Injector i) {
    i.add<SignBloc>(SignBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => LoginPage());
  }
}
