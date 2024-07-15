import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/sampling/data/datasources/sampling_remote_datasource.dart';
import 'package:fms/features/sampling/data/repositories/sampling_repository_impl.dart';
import 'package:fms/features/sampling/domain/usecases/get_samplings_no_synced_usecase.dart';
import 'package:fms/features/sampling/domain/usecases/get_samplings_not_completed_usecase.dart';
import 'package:fms/features/sampling/domain/usecases/get_samplings_usecase.dart';
import 'package:fms/features/sampling/domain/usecases/update_samplings_usecase.dart';
import 'package:fms/features/sampling/presentation/pages/samplings_page.dart';

import '../../routes/routes.dart';
import '../home/domain/entities/general_item_data.dart';
import 'data/datasources/sampling_local_datasource.dart';
import 'presentation/bloc/sampling_bloc.dart';
import 'presentation/cubit/get_samplings_cubit.dart';

class SamplingModule extends Module {
  static String route = '/sampling/';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.addSingleton(SamplingRemoteDataSource.new);
    i.addSingleton(SamplingLocalDatasource.new);
    i.addSingleton(SamplingRepositoryImpl.new);
    i.addSingleton(GetSamplingUsecase.new);
    i.addSingleton(UpdateSamplingUsecase.new);
    i.addSingleton(GetSamplingsNoSyncedDataUsecase.new);
    i.addSingleton(GetSamplingsNotCompletedUsecase.new);
    i.add(GetSamplingsCubit.new);
    i.add(SamplingBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root,
        child: (context) => SamplingsPage(
              entity: r.args.data as GeneralFeatureData,
            ));
  }
}
