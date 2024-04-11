import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/feature_entity.dart';
import 'package:fms/features/report/presentation/cubit/report_cubit.dart';
import 'package:fms/features/report/presentation/pages/report_page.dart';

import '../../routes/routes.dart';
import 'domain/entities/report_entity.dart';

class ReportModule extends Module {
  static const String route = '/photography/';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<ReportCubit>(ReportCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => ReportPage(entity: r.args.data as FeatureEntity),
    );
  }
}
