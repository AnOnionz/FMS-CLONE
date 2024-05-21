import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_page.dart';
import 'package:fms/features/statistic/statistic_module.dart';

import '../../routes/routes.dart';
import '../home/domain/entities/general_item_data.dart';

class IndividualStatisticModule extends Module {
  static const String route = '/onlineIndividualSummaryReport/';

  @override
  List<Module> get imports => [StatisticModule()];
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) =>
          StatisticIndividualPage(entity: r.args.data as GeneralFeatureData),
    );
  }
}
