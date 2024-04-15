import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/statistic/presentation/bloc/statistic_bloc.dart';

import '../../routes/routes.dart';
import 'presentation/pages/statistic_page.dart';

class IndividualStatisticModule extends Module {
  static const String route = '/onlineIndividualSummaryReport/';

  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<StatisticBloc>(StatisticBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => StatisticPage(),
    );
  }
}
