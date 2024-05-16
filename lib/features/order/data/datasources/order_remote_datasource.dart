import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../images/data/datasource/images_remote_datasource.dart';
import '../../domain/entities/order_entity.dart';

abstract class IOrderRemoteDataSource {
  Future<List<CustomerInfo>> getCustomerInfo(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId});
  Future<OrderEntity?> createOrder(OrderEntity order);
  Future<OrderEntity?> updateOrder(OrderEntity order);
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo,
      required int featureId,
      required int attendanceId,
      required int orderId});
  Future<List<OrderEntity>> fetchOrders(
      {required int attendanceId, required int featureId});
  Future<List<PhotoEntity>> fetchOrderPhotos(
      {required int attendanceId,
      required int featureId,
      required int orderId});
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

  @override
  Future<OrderEntity?> createOrder(OrderEntity order) async {
    final data = order.toMap();
    final _resp = await dio.post(
        path:
            '/app/attendances/${order.attendanceId}/features/${order.featureId}/orders',
        data: data);

    return parseJson<OrderEntity>((json: _resp, fromJson: OrderEntity.fromMap));
  }

  @override
  Future<List<OrderEntity>> fetchOrders(
      {required int attendanceId, required int featureId}) async {
    final _resp = await dio.get(
        path: '/app/attendances/${attendanceId}/features/${featureId}/orders');

    return parseListJson((listJson: _resp, fromJson: OrderEntity.fromMap));
  }

  @override
  Future<OrderEntity?> updateOrder(OrderEntity order) async {
    final data = order.toUpdateMap();
    final _resp = await dio.put(
        path:
            '/app/attendances/${order.attendanceId}/features/${order.featureId}/orders/${order.id}',
        data: data);
    return parseJson((json: _resp, fromJson: OrderEntity.fromMap));
  }

  @override
  Future<List<PhotoEntity>> fetchOrderPhotos(
      {required int attendanceId,
      required int featureId,
      required int orderId}) async {
    final _resp = await dio.get(
      path:
          '/app/attendances/${attendanceId}/features/${featureId}/orders/${orderId}/photos',
    );

    return parseListJson((listJson: _resp, fromJson: PhotoEntity.fromMap));
  }

  @override
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo,
      required int featureId,
      required int attendanceId,
      required int orderId}) async {
    Map<String, dynamic> formData;
    if (photo.image != null) {
      formData = {
        'dataUuid': photo.dataUuid,
        'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
        'featurePhotoId': photo.featurePhotoId,
        'imageId': photo.image!.id,
      };
    } else {
      final imageUploadModel = await uploadImageToServer(XFile(photo.path!));
      if (imageUploadModel != null) {
        formData = {
          'dataUuid': photo.dataUuid,
          'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
          'featurePhotoId': photo.featurePhotoId,
          'imageId': imageUploadModel.id,
        };
      } else {
        return null;
      }
    }

    final _resp = await dio.post(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/orders/${orderId}/photos',
        data: formData);

    return parseJson<PhotoEntity>((json: _resp, fromJson: PhotoEntity.fromMap));
  }
}
