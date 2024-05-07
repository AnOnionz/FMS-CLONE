import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/images/image_module.dart';
import 'package:fms/features/report/data/datasources/report_local_datasource.dart';
import 'package:fms/features/report/data/datasources/report_remote_datasource.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';
import 'package:fms/features/report/domain/usecases/create_photos_usecase.dart';
import 'package:fms/features/report/domain/usecases/get_photos_usecase.dart';
import 'package:fms/features/report/presentation/cubit/report_cubit.dart';
import 'package:fms/features/report/presentation/pages/report_page.dart';
import 'package:fms/routes/core_module.dart';

import '../../routes/routes.dart';
import 'domain/usecases/get_photos_not_completed_usecase.dart';
import 'domain/usecases/photos_no_synced_usecase.dart';

class ReportModule extends Module {
  static const String route = '/photography/';
  @override
  List<Module> get imports => [CoreModule(), ImageModule()];
  @override
  void binds(Injector i) {
    i.addLazySingleton(ReportLocalDataSource.new);
    i.addLazySingleton(ReportRemoteDataSource.new);
    i.addLazySingleton(ReportRepositoryImpl.new);
    i.addLazySingleton(GetPhotosUsecase.new);
    i.addLazySingleton(GetPhotosNotCompletedUsecase.new);
    i.addLazySingleton(CreatePhotosUsecase.new);
    i.addLazySingleton(PhotosNoSyncedDataUsecase.new);
    i.add<ReportCubit>(ReportCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => ReportPage(entity: r.args.data as GeneralFeatureData),
    );
  }
}
