import 'package:flutter_modular/flutter_modular.dart';
import '../../routes/core_module.dart';
import '../../routes/routes.dart';
import 'presentation/blocs/locate/cubit/locate_cubit.dart';
import 'presentation/pages/attendace_locate_page.dart';
import 'presentation/pages/attendance_page.dart';

class AttendanceModule extends Module {
  static const String route = '/timekeeping/';
  static const String attendance = 'attendance';

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<LocateCubit>(LocateCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => const AttendanceLocatePage(),
    );
    r.child(
      Routes.root + attendance,
      child: (_) => const AttendancePage(),
    );
  }
}
