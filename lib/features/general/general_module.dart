import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance/attendance_core_module.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:fms/features/general/data/datasource/general_remote_datasource.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/usecase/clear_general_usercase.dart';
import 'package:fms/features/general/domain/usecase/create_general_usecase.dart';
import 'package:fms/features/general/domain/usecase/get_general_usecase.dart';
import 'package:fms/features/general/domain/usecase/refresh_general_usecase.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';

import '../../routes/core_module.dart';
import 'data/datasource/general_local_datasource.dart';
import 'domain/usecase/get_config_usecase.dart';

class GeneralModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(GeneralLocalDataSource.new);
    i.addLazySingleton(GeneralRemoteDatasorce.new);
    i.add(AttendanceRemoteDataSource.new);
    i.addLazySingleton(GeneralRepository.new);
    i.addLazySingleton(CreateGeneralUseCase.new);
    i.addLazySingleton(RefreshGeneralUseCase.new);
    i.addLazySingleton(GetAttendanceInfoUsecase.new);
    i.addLazySingleton(GetConfigUsecase.new);
    i.addLazySingleton(GetGeneralUseCase.new);
    i.addLazySingleton(ClearGeneralUseCase.new);
    i.addLazySingleton(GeneralBloc.new);
  }
}
