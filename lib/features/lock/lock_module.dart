import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/routes.dart';
import 'data/repositories/data_lock_repository.dart';
import 'domain/usecases/delete_passcode_usecase.dart';
import 'domain/usecases/has_passcode_usecase.dart';
import 'domain/usecases/save_passcode_usecase.dart';
import 'domain/usecases/validate_passcode_usecase.dart';
import 'presentation/bloc/lock_bloc.dart';
import 'presentation/bloc/passcode_bloc.dart';
import 'presentation/pages/lock_screen_create_page.dart';
import 'presentation/pages/lock_screen_page.dart';

class LockModule extends Module {
  static const String route = '/lock/';
  static const String create = 'create';

  @override
  void binds(Injector i) {
    i.addLazySingleton(DataLockRepository.new);
    i.addLazySingleton(DeletePasscodeUsecase.new);
    i.addLazySingleton(HasPasscodeUsecase.new);
    i.addLazySingleton(SavePasscodeUsecase.new);
    i.addLazySingleton(ValidatePasscodeUsecase.new);
    i.addLazySingleton(
      LockBloc.new,
      config: BindConfig<LockBloc>(onDispose: (bloc) => bloc.close()),
    );
    i.addLazySingleton(
      PasscodeBloc.new,
      config: BindConfig<PasscodeBloc>(onDispose: (bloc) => bloc.close()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root,
        child: (_) => LockScreenPage(canPop: r.args.data as bool));
    r.child(Routes.root + create, child: (_) => const LockScreenCreatePage());
  }
}
