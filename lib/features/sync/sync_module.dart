import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/sync/presentation/bloc/sync_bloc.dart';
import 'package:fms/features/sync/presentation/pages/sync_page.dart';

import '../../routes/routes.dart';

class SyncModule extends Module {
  static const String route = '/synchronization/';
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.add(SyncBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => SyncPage(),
    );
  }
}
