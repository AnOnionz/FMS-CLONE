import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance/attendance_core_module.dart';
import 'package:fms/features/config/domain/usecases/get_config_usecase.dart';
import 'package:fms/features/config/presentation/bloc/config_bloc.dart';
import 'package:fms/features/general/general_module.dart';

import 'data/datasources/config_datasource.dart';
import 'data/repositories/config_repository_impl.dart';

class ConfigModule extends Module {
  @override
  List<Module> get imports => [GeneralModule(), AttendanceCoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(ConfigDatasource.new);
    i.addLazySingleton(ConfigRepositoryImpl.new);
    i.add(GetConfigUsecase.new);
    i.add(ConfigBloc.new);
  }

  @override
  void routes(RouteManager r) {}
}
