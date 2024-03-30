import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/urgency/presentation/cubit/urgency_cubit.dart';

import '../../routes/routes.dart';
import 'presentation/pages/urgency_page.dart';

class UgrencyModule extends Module {
  static const String route = '/urgency/';
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.add(UrgencyCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => const UrgencyPage(),
    );
  }
}
