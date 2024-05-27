import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance_report/presentation/pages/attendance_report_page.dart';

import '../../routes/routes.dart';
import 'presentation/pages/attendance_report_detail_page.dart';

class AttendanceReportModule extends Module {
  static const route = '/onlineTeamAttendanceReport/';
  static const detail = 'attendance_report_detail';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => AttendanceReportPage(),
    );
    r.child(
      Routes.root + detail,
      child: (_) => AttendanceReportDetailPage(),
    );
  }
}
