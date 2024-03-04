import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/client/dio_client.dart';
import '../../core/localization/locale_manager.dart';
import '../../core/permission/permisson_manager.dart';
import '../../core/services/location/location_service.dart';
import '../../core/styles/theme_manager.dart';
import '../../features/authentication/domain/usecases/login_usecase.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../routes/admin_module.dart';
import '../../routes/routes.dart';
import '../features/attendance/presentation/blocs/locate/cubit/locate_cubit.dart';
import '../features/attendance/presentation/pages/attendace_locate_page.dart';

import '../features/attendance/presentation/pages/attendance_page.dart';
import '../features/authentication/data/datasources/user_local_data_source.dart';
import '../features/authentication/data/datasources/user_remote_data_source.dart';
import '../features/authentication/domain/repositories/user_repository.dart';
import '../features/authentication/domain/usecases/logout_usecase.dart';
import '../features/authentication/presentation/blocs/authentication_bloc.dart';
import '../features/authentication/presentation/blocs/sign_bloc.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/leave/presentation/pages/leave_page.dart';
import '../features/normal_splash_page.dart';

import '../features/workForce/presentation/pages/booth_selection_page.dart';
import '../features/workForce/presentation/pages/project_selection_page.dart';
import '../features/workForce/presentation/pages/work_force_page.dart';

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
    i.add<LocateCubit>(LocateCubit.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root,
        child: (_) => const SplashPage(), transition: TransitionType.fadeIn);
    r.module(Routes.admin, module: AdminModule());
    r.child(Routes.home,
        child: (_) => HomePage(), transition: TransitionType.fadeIn);
    r.child(Routes.login,
        child: (_) => const LoginPage(), transition: TransitionType.fadeIn);
    r.child(Routes.workForce,
        child: (_) => const WorkForcePage(), transition: TransitionType.fadeIn);
    r.child(Routes.projectSelection,
        child: (_) => const ProjectSelectionPage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.boothSelection,
        child: (_) => const BoothSelectionPage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.locate,
        child: (_) => const AttendanceLocatePage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.attendance,
        child: (_) => const AttendancePage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.leave,
        child: (_) => const LeavePage(), transition: TransitionType.fadeIn);
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
