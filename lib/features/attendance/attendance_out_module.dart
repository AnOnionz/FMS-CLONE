import 'package:flutter_modular/flutter_modular.dart';
import '../../core/constant/enum.dart';
import '../../routes/core_module.dart';
import '../../routes/routes.dart';
import 'presentation/bloc/locate_cubit.dart';
import 'presentation/pages/attendace_locate_page.dart';
import 'presentation/pages/attendance_page.dart';

class AttendanceOutModule extends Module {
  static const String route = '/attendance_out/';
  static const String attendance = 'form';

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<LocateCubit>(LocateCubit.new, config: blocConfig());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => const AttendanceLocatePage(),
    );
    r.child(
      Routes.root + attendance,
      child: (_) => const AttendancePage(type: AttendanceType.CheckOut),
    );
  }
}
