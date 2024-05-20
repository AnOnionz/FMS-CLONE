import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/statistic/data/datasources/statistic_remote_datasource.dart';
import 'package:fms/features/statistic/data/repositories/statistic_repository_impl.dart';
import 'package:fms/features/statistic/domain/usecases/fetch_employee_statistic_usecase.dart';
import 'package:fms/features/statistic/domain/usecases/fetch_team_members_usecase.dart';
import 'package:fms/features/statistic/presentation/bloc/statistic_bloc.dart';

import '../../routes/routes.dart';
import 'domain/usecases/fetch_individual_statistic_usecase.dart';
import 'domain/usecases/fetch_team_statistic_usecase.dart';
import 'presentation/pages/statistic_individual_page.dart';
import 'presentation/pages/statistic_page.dart';

class StatisticModule extends Module {
  static const String route = '/onlineTeamSummaryReport/';
  static const String employee = 'employee';

  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.addLazySingleton(StatisticRemoteDataSource.new);
    i.addLazySingleton(StatisticRepositoryImpl.new);
    i.addLazySingleton(FetchEmployeeStatisticUseCase.new);
    i.addLazySingleton(FetchTeamStatisticUseCase.new);
    i.addLazySingleton(FetchIndividualStatisticUseCase.new);
    i.addLazySingleton(FetchTeamMembersUseCase.new);
    i.add(StatisticBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => StatisticPage(
          isTeam: true, entity: r.args.data as GeneralFeatureData),
    );

    r.child(
      Routes.root + employee,
      child: (_) =>
          StatisticEmployeePage(entity: r.args.data as GeneralFeatureData),
    );
  }
}
