import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/crawl/data/datasources/crawl_local_datasource.dart';
import 'package:fms/features/crawl/data/repositories/crawl_repository_impl.dart';
import 'package:fms/features/crawl/domain/usecases/crawl_data_usecase.dart';
import 'package:fms/features/crawl/domain/usecases/get_quantities_not_completed_usecase.dart';
import 'package:fms/features/crawl/domain/usecases/get_quantities_usecase.dart';
import 'package:fms/features/crawl/domain/usecases/quantities_no_synced_usecase.dart';

import '../../routes/routes.dart';
import '../home/domain/entities/general_item_data.dart';
import 'data/datasources/crawl_remote_datasource.dart';
import 'presentation/cubit/crawl_cubit.dart';
import 'presentation/pages/crawl_page.dart';

class CrawlModule extends Module {
  static const String route = '/multipleEntitiesQuantityCapturing/';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.addLazySingleton(CrawlLocalDatasource.new);
    i.addLazySingleton(CrawlRemoteDatasource.new);
    i.addLazySingleton(CrawlRepositoryImpl.new);
    i.addLazySingleton(GetQuantitiesUsecase.new);
    i.addLazySingleton(CrawlDataUsecase.new);
    i.addLazySingleton(GetQuantitiesNotCompletedUsecase.new);
    i.addLazySingleton(GetQuantitiesNoSyncedDataUsecase.new);
    i.add<CrawlCubit>(CrawlCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => CrawlPage(entity: r.args.data as GeneralItemData),
    );
  }
}
