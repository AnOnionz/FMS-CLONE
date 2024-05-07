import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/order/data/datasources/order_local_datasource.dart';
import 'package:fms/features/order/data/datasources/order_remote_datasource.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/domain/repositories/order_repository.dart';

import '../../../../core/usecase/either.dart';

class OrderRepositoryImpl extends Repository implements OrderRepository {
  final OrderLocalDataSource local;
  final OrderRemoteDataSource remote;

  OrderRepositoryImpl(this.local, this.remote);
  @override
  Future<Result<List<CustomerInfo>>> identifyCustomer(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId}) {
    return todo(() async {
      final customerInfos = await remote.getCustomerInfo(
          customerIdentitys: customerIdentitys,
          attendanceId: attendanceId,
          featureId: featureId);

      return Right(customerInfos);
    });
  }
}
