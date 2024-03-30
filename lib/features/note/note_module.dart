import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/note/presentation/cubit/note_cubit.dart';
import 'package:fms/features/note/presentation/pages/note_page.dart';

import '../../routes/routes.dart';

class NoteModule extends Module {
  static const String route = '/note/';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<NoteCubit>(NoteCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => const NotePage(),
    );
  }
}
