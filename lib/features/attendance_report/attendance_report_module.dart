import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance_report/presentation/pages/attendance_report_page.dart';

class AttendanceReportModule extends Module {
  static const route = '/attendance_report';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => AttendanceReportPage(),
    );
  }
}
