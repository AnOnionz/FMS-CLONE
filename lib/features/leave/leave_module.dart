import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/leave/presentation/pages/leave_page.dart';

import '../../routes/routes.dart';
import 'presentation/cubit/leave_cubit.dart';

class LeaveModule extends Module {
  static const String route = '/leave/';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<LeaveCubit>(LeaveCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => const LeavePage(),
    );
  }
}
