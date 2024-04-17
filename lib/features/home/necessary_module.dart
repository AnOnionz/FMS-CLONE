import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/routes.dart';
import '../general/general_module.dart';
import '../report/report_module.dart';
import 'presentation/bloc/necessary_bloc.dart';
import 'presentation/pages/home_page.dart';

class NecessaryModule extends Module {
  @override
  List<Module> get imports => [GeneralModule(), ReportModule()];

  @override
  void binds(Injector i) {
    i.add(NecessaryBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => HomePage(),
    );
  }
}
