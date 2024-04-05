import 'package:flutter_modular/flutter_modular.dart';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/attendance_core_module.dart';
import 'package:fms/features/attendance/domain/entities/feature_entity.dart';
import 'package:fms/features/attendance/presentation/pages/attendace_locate_page.dart';
import 'package:fms/features/attendance/presentation/pages/attendance_flow_page.dart';
import 'package:fms/features/attendance/presentation/pages/attendance_page.dart';

import '../../routes/routes.dart';

class AttendanceInModule extends Module {
  static const String route = '/attendanceClockingIn/';
  static const String locate = 'locate';
  static const String attendance = 'attendance';

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
      Routes.root + locate,
      child: (_) => AttendanceLocatePage(entity: r.args.data as FeatureEntity),
    );
    r.child(
      Routes.root + attendance,
      child: (_) => AttendancePage(
          type: AttendanceType.CheckIn, entity: r.args.data as FeatureEntity),
    );
  }
}
