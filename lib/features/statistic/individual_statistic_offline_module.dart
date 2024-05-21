import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_page.dart';
import 'package:fms/features/statistic/statistic_module.dart';

import '../../routes/routes.dart';
import '../home/domain/entities/general_item_data.dart';

class IndividualStatisticOfflineModule extends Module {
  static const String route = '/summaryReport/';

  @override
  List<Module> get imports => [StatisticModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => StatisticIndividualOfflinePage(
        entity: r.args.data as GeneralFeatureData,
      ),
    );
  }
}
