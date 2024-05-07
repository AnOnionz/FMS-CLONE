import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class OrderRepository {
  Future<Result<List<CustomerInfo>>> identifyCustomer(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId});
}
