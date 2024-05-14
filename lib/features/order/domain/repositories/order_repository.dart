import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';

abstract class OrderRepository {
  Future<Result<List<CustomerInfo>>> identifyCustomer(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId});
  Future<Result<void>> createOrder({
    required OrderEntity order,
  });
  Future<Result<void>> updateOrder({
    required OrderEntity order,
  });
  Future<Result<List<OrderEntity>>> allOrders({required int featureId});

  Future<Result<FeatureEntity?>> getOrdersNotCompleted(
      {required FeatureEntity feature});
  Future<Result<Map<int, List<OrderEntity>>>> noSyncedData();
  Future<void> synchronized(FeatureEntity feature);
}
