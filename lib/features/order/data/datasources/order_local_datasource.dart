import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../general/presentation/page/mixin_general.dart';

abstract class IOrderLocalDataSource {
  void cacheOrderToLocal(OrderEntity order);
  void cachePhotoToLocal(PhotoEntity photo);
  Future<List<OrderEntity>> getOrdersNoSyncedByFeature(int featureId);
  Future<List<OrderEntity>> getOrdersByFeature(int featureId);
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity?> getOrderByUuid(String uuid);
}

class OrderLocalDataSource
    with LocalDatasource, GeneralDataMixin
    implements IOrderLocalDataSource {
  @override
  void cacheOrderToLocal(OrderEntity order) {
    db.addObject<OrderEntity>(order);
  }

  @override
  void cachePhotoToLocal(PhotoEntity photo) {
    db.addObject<PhotoEntity>(photo);
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();

    return db.filter<OrderEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<OrderEntity>> getOrdersByFeature(int featureId) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();

    return db.filter<OrderEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .featureIdEqualTo(featureId)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<OrderEntity>> getOrdersNoSyncedByFeature(int featureId) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();

    return db.filter<OrderEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .featureIdEqualTo(featureId)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.isNoSynced)
        .build());
  }

  @override
  Future<OrderEntity?> getOrderByUuid(String uuid) async {
    return db
        .filter<OrderEntity>((filter) => filter.dataUuidEqualTo(uuid).build())
        .firstOrNull;
  }
}
