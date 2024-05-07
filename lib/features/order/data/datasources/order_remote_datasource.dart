import 'package:fms/core/utilities/parser.dart';

import '../../../images/data/datasource/images_remote_datasource.dart';
import '../../domain/entities/order_entity.dart';

abstract class IOrderRemoteDataSource {
  Future<List<CustomerInfo>> getCustomerInfo(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId});
}

class OrderRemoteDataSource extends ImagesRemoteDataSource
    implements IOrderRemoteDataSource {
  OrderRemoteDataSource(super.dio);

  @override
  Future<List<CustomerInfo>> getCustomerInfo(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId}) async {
    final data = {
      'fields': customerIdentitys
          .map((customerIdentity) =>
              '${customerIdentity.featureCustomerId},${customerIdentity.value ?? ''}')
          .toList()
    };

    final _resp = await dio.get(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/orders/customer',
        queryParameters: data);

    if (_resp == null || _resp == '') {
      return [];
    }
    return parseListJson((
      listJson: _resp['customerInfos'] as List<dynamic>,
      fromJson: CustomerInfo.fromMap
    ));
  }
}
