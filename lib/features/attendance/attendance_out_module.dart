import 'package:flutter_modular/flutter_modular.dart';

import 'package:fms/features/attendance/attendance_core_module.dart';

import '../../core/constant/enum.dart';
import '../../routes/routes.dart';
import '../home/domain/entities/general_item_data.dart';
import 'presentation/pages/attendace_locate_page.dart';
import 'presentation/pages/attendance_flow_page.dart';
import 'presentation/pages/attendance_page.dart';

class AttendanceOutModule extends Module {
  static const String route = '/attendanceClockingOut/';

  @override
  List<Module> get imports => [
        AttendanceCoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => AttendanceFlowPage(entity: r.args.data as GeneralItemData),
    );
    r.child(
      Routes.root + AttendanceCoreModule.locate,
      child: (_) =>
          AttendanceLocatePage(entity: r.args.data as GeneralItemData),
    );
    r.child(
      Routes.root + AttendanceCoreModule.attendance,
      child: (_) => AttendancePage(
          type: AttendanceType.CheckOut,
          entity: r.args.data as GeneralItemData),
    );
  }
}
