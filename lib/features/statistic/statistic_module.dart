import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/statistic/presentation/bloc/statistic_bloc.dart';

import '../../routes/routes.dart';
import 'presentation/pages/statistic_page.dart';
import 'presentation/pages/statistic_sp_page.dart';

class StatisticModule extends Module {
  static const String route = '/onlineTeamSummaryReport/';
  static const String outlet = 'outlet';
  static const String booth = 'booth';
  static const String employee = 'employee';

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
      child: (_) => StatisticPage(isSup: true),
    );

    r.child(
      Routes.root + outlet,
      child: (_) => const StatisticOutletPage(),
    );
    r.child(
      Routes.root + booth,
      child: (_) => const StatisticBoothPage(),
    );
    r.child(
      Routes.root + employee,
      child: (_) => const StatisticEmployeePage(),
    );
  }
}
