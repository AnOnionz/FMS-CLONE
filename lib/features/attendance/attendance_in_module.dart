import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/attendance_core_module.dart';
import 'package:fms/features/attendance/presentation/pages/attendace_locate_page.dart';
import 'package:fms/features/attendance/presentation/pages/attendance_flow_page.dart';
import 'package:fms/features/attendance/presentation/pages/attendance_page.dart';
import 'package:fms/features/home/domain/entities/feature_entity.dart';

import '../../routes/routes.dart';

class AttendanceInModule extends Module {
  static const String route = '/attendanceClockingIn/';

  @override
  List<Module> get imports => [
        AttendanceCoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => AttendanceFlowPage(entity: r.args.data as FeatureEntity),
    );
    r.child(
      Routes.root + AttendanceCoreModule.locate,
      child: (_) => AttendanceLocatePage(entity: r.args.data as FeatureEntity),
    );
    r.child(
      Routes.root + AttendanceCoreModule.attendance,
      child: (_) => AttendancePage(
          type: AttendanceType.CheckIn, entity: r.args.data as FeatureEntity),
    );
  }
}
