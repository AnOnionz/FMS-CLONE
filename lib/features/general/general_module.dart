import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/usecase/create_general_usecase.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';

import '../../routes/core_module.dart';
import 'data/datasource/general_local_datasource.dart';

class GeneralModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(GeneralLocalDataSource.new);
    i.addLazySingleton(GeneralRepository.new);
    i.add(CreateGeneralUseCase.new);
    i.addLazySingleton(GeneralBloc.new);
  }
}
