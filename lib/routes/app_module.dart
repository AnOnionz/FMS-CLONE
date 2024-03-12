import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/note/presentation/pages/note_page.dart';
import 'package:fms/features/redeem_gift/presentation/pages/history_exchange.dart';
import 'package:fms/features/redeem_gift/presentation/pages/redeem_gift_page.dart';
import 'package:fms/features/redeem_gift/presentation/pages/success_page.dart';
import 'package:fms/features/setting/presentation/pages/app_lock_page.dart';
import 'package:fms/features/setting/presentation/pages/setting_page.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_page.dart';
import 'package:fms/features/urgency/presentation/pages/urgency_page.dart';
import 'package:fms/features/workForce/presentation/pages/outlet_selection_page.dart';

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

import '../features/redeem_gift/presentation/pages/history_exchange_detail.dart';
import '../features/workForce/presentation/pages/booth_selection_page.dart';
import '../features/workForce/presentation/pages/project_selection_page.dart';
import '../features/workForce/presentation/pages/work_force_page.dart';
import 'core_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  void binds(i) {
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
    r.child(Routes.outletSelection,
        child: (_) => const OutletSelectionPage(),
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
    r.child(Routes.setting,
        child: (_) => const SettingPage(), transition: TransitionType.fadeIn);
    r.child(Routes.appLock,
        child: (_) => const AppLockPage(), transition: TransitionType.fadeIn);
    r.child(Routes.appLock,
        child: (_) => const AppLockPage(), transition: TransitionType.fadeIn);
    r.child(Routes.urgency,
        child: (_) => const UrgencyPage(), transition: TransitionType.fadeIn);
    r.child(Routes.note,
        child: (_) => const NotePage(), transition: TransitionType.fadeIn);
    r.child(Routes.redeemGift,
        child: (_) => const RedeemGiftPage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.congratulation,
        child: (_) => const SuccessPage(), transition: TransitionType.fadeIn);
    r.child(Routes.statistic,
        child: (_) => const StatisticPage(), transition: TransitionType.fadeIn);
    r.child(Routes.historyExchange,
        child: (_) => const HistoryExchangePage(),
        transition: TransitionType.fadeIn);
    r.child(Routes.historyExchangeDetail,
        child: (_) => const HistoryExchangeDetailPage(),
        transition: TransitionType.fadeIn);
  }

  BindConfig<T> blocConfig<T extends Bloc<dynamic, dynamic>>() {
    return BindConfig(
      notifier: (bloc) => bloc.stream,
      onDispose: (bloc) => bloc.close(),
    );
  }
}
