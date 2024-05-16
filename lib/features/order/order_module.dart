import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/images/image_module.dart';
import 'package:fms/features/order/data/datasources/order_local_datasource.dart';
import 'package:fms/features/order/data/repositories/order_repository_impl.dart';
import 'package:fms/features/order/domain/usecases/create_order_usecase.dart';
import 'package:fms/features/order/domain/usecases/get_orders_no_synced_usecase.dart';
import 'package:fms/features/order/domain/usecases/get_orders_not_completed_usecase.dart';
import 'package:fms/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:fms/features/order/domain/usecases/identify_customer_usecase.dart';
import 'package:fms/features/order/presentation/cubit/identify_cubit.dart';
import 'package:fms/features/order/presentation/pages/barcode_scanner_page.dart';

import '../../routes/routes.dart';
import 'data/datasources/order_remote_datasource.dart';
import 'presentation/bloc/order_bloc.dart';
import 'presentation/pages/order_page.dart';
import 'presentation/pages/success_page.dart';

class OrderModule extends Module {
  static const String route = '/customerInformationCapturing/';
  static const String productBarcodeScanner = 'product_barcode_scanner';
  static const String success = 'success';
  static const String updateSuccess = 'update_success';

  @override
  List<Module> get imports => [ImageModule()];
  @override
  void binds(Injector i) {
    i.addLazySingleton(OrderLocalDataSource.new);
    i.addLazySingleton(OrderRemoteDataSource.new);
    i.addLazySingleton(OrderRepositoryImpl.new);
    i.addLazySingleton(IdentifyCustomerUsecase.new);
    i.addLazySingleton(GetOrdersNoSyncedDataUsecase.new);
    i.addLazySingleton(GetOrdersNotCompletedUsecase.new);
    i.addLazySingleton(GetOrdersUsecase.new);
    i.addLazySingleton(CreateOrderUsecase.new);
    i.add(IdentifyCubit.new);
    i.add(OrderBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => OrderPage(
        entity: r.args.data as GeneralFeatureData,
      ),
    );
    r.child(
      Routes.root + productBarcodeScanner,
      child: (_) => BarcodeScanner(),
    );
    r.child(
      Routes.root + success,
      child: (_) => SuccessPage(
        generalFeature: r.args.data as GeneralFeatureData,
      ),
    );
    r.child(
      Routes.root + updateSuccess,
      child: (_) => SuccessPage(
        isUpdate: true,
      ),
    );
  }
}
