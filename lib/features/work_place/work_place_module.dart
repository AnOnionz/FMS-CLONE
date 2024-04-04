import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/config/domain/usecases/get_config_usecase.dart';
import 'package:fms/features/sign/sign_module.dart';
import 'package:fms/features/work_place/data/datasources/work_place_datasource.dart';
import 'package:fms/features/work_place/data/repositories/work_place_repository_impl.dart';
import 'package:fms/features/work_place/domain/usecases/get_projects_usecase.dart';
import 'package:fms/features/work_place/presentation/bloc/fetch_work_place_bloc.dart';
import 'package:fms/features/work_place/presentation/bloc/work_place_bloc.dart';

import 'package:fms/features/work_place/presentation/pages/work_place_page.dart';

import '../../routes/routes.dart';
import '../config/config_module.dart';
import 'domain/usecases/get_booths_usecase.dart';
import 'domain/usecases/get_outlets_usecase.dart';
import 'presentation/pages/booth_selection_page.dart';
import 'presentation/pages/outlet_selection_page.dart';
import 'presentation/pages/project_selection_page.dart';

class WorkPlaceModule extends Module {
  static const String route = '/work_place/';
  static const String selectProject = 'select_project';
  static const String selectOutlet = 'select_outlet';
  static const String selectBooth = 'select_booth';
  static const String config = 'config';
  @override
  List<Module> get imports => [SignModule(), ConfigModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(WorkPlaceDatasource.new);
    i.addLazySingleton(WorkPlaceRepositoryImpl.new);
    i.add(GetConfigUsecase.new);
    i.add(GetProjectsUsecase.new);
    i.add(GetOutletsUsecase.new);
    i.add(GetBoothsUsecase.new);
    i.addSingleton(WorkPlaceBloc.new);
    i.add(FetchWorkPlaceBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => WorkPlacePage(),
    );
    r.child(
      Routes.root + selectProject,
      child: (_) => ProjectSelectionPage(),
    );
    r.child(
      Routes.root + selectOutlet,
      child: (_) => OutletSelectionPage(),
    );
    r.child(
      Routes.root + selectBooth,
      child: (_) => BoothSelectionPage(),
    );
  }
}
