import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/images/data/datasource/delete_image_remote_datasource.dart';
import 'package:fms/features/images/data/repositories/delete_image_repository_impl.dart';
import 'package:fms/features/images/domain/usecases/delete_image_usecase.dart';
import 'package:fms/features/images/presentation/bloc/delete_image_bloc.dart';

import 'package:fms/routes/core_module.dart';

import 'data/datasource/delete_image_local_remote_datasource.dart';
import 'domain/usecases/delete_local_image_usecase.dart';

class ImageModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(Injector i) {
    i.addLazySingleton(DeleteImageRemoteDataSource.new);
    i.addLazySingleton(DeleteImageLocalDataSource.new);
    i.addLazySingleton(DeleteImageRepositoryImpl.new);
    i.addLazySingleton(DeleteImageUseCase.new);
    i.addLazySingleton(DeleteLocalImageUseCase.new);
    i.add<DeleteImageBloc>(DeleteImageBloc.new);
  }
}
