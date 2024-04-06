import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:fms/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:fms/features/attendance/domain/usecases/attendance_usecase.dart';
import 'package:fms/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:fms/features/attendance/presentation/bloc/cubit/attendance_flow_cubit.dart';
import 'package:fms/features/authentication/authentication_module.dart';
import '../../routes/core_module.dart';
import 'presentation/bloc/locate_cubit.dart';

class AttendanceCoreModule extends Module {
  static const String locate = 'locate';
  static const String attendance = 'attendance';
  @override
  List<Module> get imports => [CoreModule(), AuthenticationModule()];

  @override
  void binds(Injector i) {
    i.add<LocateCubit>(LocateCubit.new, config: blocConfig());
    i.addSingleton(AttendanceRemoteDataSource.new);
    i.addSingleton(AttendanceRepositoryImpl.new);
    i.addSingleton(AttendanceUsecase.new);
    i.add<AttendanceBloc>(AttendanceBloc.new, config: blocConfig());
    i.add<AttendanceFlowCubit>(AttendanceFlowCubit.new);
  }
}
