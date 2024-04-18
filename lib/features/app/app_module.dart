import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/environment/env.dart';
import 'package:fms/features/app/presentation/pages/app_page.dart';
import 'package:fms/features/app_information/app_infomation_module.dart';
import 'package:fms/features/attendance/attendance_out_module.dart';
import 'package:fms/features/authentication/authentication_module.dart';
import 'package:fms/features/crawl/crawl.module.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/lock/lock_module.dart';
import 'package:fms/features/note/note_module.dart';
import 'package:fms/features/redeem_gift/redeem_gift_module.dart';
import 'package:fms/features/report/report_module.dart';
import 'package:fms/features/setting/setting_module.dart';
import 'package:fms/features/sign/sign_module.dart';
import 'package:fms/features/statistic/statistic_module.dart';
import 'package:fms/features/urgency/urgency_module.dart';

import '../../../routes/admin_module.dart';
import '../../../routes/routes.dart';
import '../../routes/core_module.dart';
import '../attendance/attendance_in_module.dart';
import '../attendance_report/attendance_report_module.dart';
import '../general/general_module.dart';
import '../leave/leave_module.dart';
import '../statistic/Individual_statistic_module.dart';
import '../sync/sync_module.dart';
import '../work_place/work_place_module.dart';
import 'presentation/bloc/app_bloc.dart';

class AppModule extends Module {
  @override
  List<Module> get imports =>
      [CoreModule(), AuthenticationModule(), GeneralModule(), SyncModule()];
  @override
  void binds(i) {
    AppConfig();
    i.addLazySingleton(AppBloc.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root,
        child: (_) => const AppPage(), transition: TransitionType.fadeIn);
    r.module(Routes.admin,
        module: AdminModule(), transition: TransitionType.fadeIn);
    r.module(SignModule.route, module: SignModule());
    r.module(WorkPlaceModule.route,
        module: WorkPlaceModule(), transition: TransitionType.fadeIn);
    r.module(HomeModule.route,
        module: HomeModule(), transition: TransitionType.fadeIn);
    r.module(AppInfomationModule.route,
        module: AppInfomationModule(), transition: TransitionType.fadeIn);
    r.module(AttendanceInModule.route,
        module: AttendanceInModule(), transition: TransitionType.fadeIn);
    r.module(AttendanceOutModule.route,
        module: AttendanceOutModule(), transition: TransitionType.fadeIn);
    r.module(AttendanceReportModule.route,
        module: AttendanceReportModule(), transition: TransitionType.fadeIn);
    r.module(CrawlModule.route,
        module: CrawlModule(), transition: TransitionType.fadeIn);
    r.module(LeaveModule.route,
        module: LeaveModule(), transition: TransitionType.fadeIn);
    r.module(NoteModule.route,
        module: NoteModule(), transition: TransitionType.fadeIn);
    r.module(RedeemGiftModule.route,
        module: RedeemGiftModule(), transition: TransitionType.fadeIn);
    r.module(ReportModule.route,
        module: ReportModule(), transition: TransitionType.fadeIn);
    r.module(SettingModule.route,
        module: SettingModule(), transition: TransitionType.fadeIn);
    r.module(SyncModule.route,
        module: SyncModule(), transition: TransitionType.fadeIn);
    r.module(UgrencyModule.route,
        module: UgrencyModule(), transition: TransitionType.fadeIn);
    r.module(StatisticModule.route,
        module: StatisticModule(), transition: TransitionType.fadeIn);
    r.module(IndividualStatisticModule.route,
        module: IndividualStatisticModule(), transition: TransitionType.fadeIn);
    r.module(LockModule.route,
        module: LockModule(), transition: TransitionType.fadeIn);
  }
}
