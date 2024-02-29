import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/client/dio_client.dart';
import '../../core/localization/locale_manager.dart';
import '../../core/permission/permisson_manager.dart';
import '../../core/services/location/location_service.dart';
import '../../core/styles/theme_manager.dart';
import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/domain/usecases/login_usecase.dart';
import '../../features/authentication/presentation/bloc/authentication_bloc.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../routes/admin_module.dart';
import '../../routes/routes.dart';
import '../features/authentication/data/datasources/user_local_data_source.dart';
import '../features/authentication/data/datasources/user_remote_data_source.dart';
import '../features/authentication/domain/repositories/user_repository.dart';
import '../features/authentication/domain/usecases/logout_usecase.dart';
import '../features/authentication/presentation/bloc/sign_bloc.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/normal_splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<DioClient>(DioClient.new);
    i.addSingleton<LocationService>(LocationService.new,
        config: listenConfig());
    i.addSingleton<ThemeManager>(ThemeManager.new, config: listenConfig());
    i.addSingleton<LocaleManager>(LocaleManager.new, config: listenConfig());
    i.addSingleton<PermissionManager>(PermissionManager.new);

    i.add<UserLocalDataSource>(UserLocalDataSourceImpl.new);
    i.add<UserRemoteDataSource>(UserRemoteDataSourceImpl.new);
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    i.addSingleton<AuthenticationBloc>(AuthenticationBloc.new);
    i.add<LoginUsecase>(LoginUsecase.new);
    i.add<LogoutUsecase>(LogoutUsecase.new);
    i.add<SignBloc>(SignBloc.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root,
        child: (_) => const SplashPage(), transition: TransitionType.fadeIn);
    r.module(Routes.admin, module: AdminModule());
    r.child(Routes.home,
        child: (_) => HomePage(
              user: r.args.data as UserEntity,
            ),
        transition: TransitionType.fadeIn);
    r.child(Routes.login,
        child: (_) => const LoginPage(), transition: TransitionType.fadeIn);
  }

  BindConfig<T> listenConfig<T extends ChangeNotifier>() {
    return BindConfig(
      notifier: (listenable) => listenable,
      onDispose: (listenable) => listenable.dispose(),
    );
  }

  BindConfig<T> blocConfig<T extends Bloc<dynamic, dynamic>>() {
    return BindConfig(
      notifier: (bloc) => bloc.stream,
      onDispose: (bloc) => bloc.close(),
    );
  }
}
