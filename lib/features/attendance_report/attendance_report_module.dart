import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance_report/presentation/pages/attendance_report_page.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../routes/routes.dart';

class AttendanceReportModule extends Module {
  static const route = '/onlineTeamAttendanceReport/';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) =>
          AttendanceReportPage(entity: r.args.data as GeneralFeatureData),
    );
  }
}
