import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/sync/sync_module.dart';

import '../../routes/routes.dart';
import '../crawl/crawl.module.dart';
import '../general/general_module.dart';
import '../report/report_module.dart';
import 'presentation/bloc/necessary_bloc.dart';
import 'presentation/pages/home_page.dart';

class NecessaryModule extends Module {
  @override
  List<Module> get imports =>
      [GeneralModule(), ReportModule(), SyncModule(), CrawlModule()];

  @override
  void binds(Injector i) {
    i.add(NecessaryBloc.new,
        config: BindConfig<NecessaryBloc>(
          notifier: (bloc) => bloc.stream,
          onDispose: (bloc) {
            bloc.subscription?.cancel();
            bloc.close();
          },
        ));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => HomePage(),
    );
  }
}
