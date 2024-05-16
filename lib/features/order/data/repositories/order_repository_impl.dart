import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/data/datasources/order_local_datasource.dart';
import 'package:fms/features/order/data/datasources/order_remote_datasource.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/domain/repositories/order_repository.dart';

import '../../../../core/usecase/either.dart';
import '../../../general/presentation/page/mixin_general.dart';
import '../../../images/data/datasource/delete_image_local_remote_datasource.dart';
import '../../../images/data/datasource/delete_image_remote_datasource.dart';

class OrderRepositoryImpl extends Repository
    with GeneralDataMixin, LocalDatasource
    implements OrderRepository {
  final OrderLocalDataSource _local;
  final OrderRemoteDataSource _remote;
  final DeletePhotoRemoteDataSource _remotePhoto;
  final DeletePhotoLocalDataSource _localPhoto;

  OrderRepositoryImpl(
      this._local, this._remote, this._remotePhoto, this._localPhoto);
  @override
  Future<Result<List<CustomerInfo>>> identifyCustomer(
      {required List<CustomerInfo> customerIdentitys,
      required int attendanceId,
      required int featureId}) {
    return todo(() async {
      final customerInfos = await _remote.getCustomerInfo(
          customerIdentitys: customerIdentitys,
          attendanceId: attendanceId,
          featureId: featureId);

      return Right(customerInfos);
    });
  }

  @override
  Future<Result<List<OrderEntity>>> allOrders({required int featureId}) async {
    return todo(() async {
      final offlineOrders = await _local.getOrdersByFeature(featureId);
      final onlineOrders = await _remote.fetchOrders(
          featureId: featureId, attendanceId: general.attendance!.id!);

      final Set<OrderEntity> orders =
          [...onlineOrders, ...offlineOrders].toSet();
      return Right(orders.toList());
    });
  }

  @override
  Future<Result<void>> createOrder({required OrderEntity order}) {
    return todo(() async {
      if (order.photos != null) {
        order.photos!.forEach((photo) {
          _local.cachePhotoToLocal(photo);
        });
        _local.cacheOrderToLocal(order);
        order.localPhotos.addAll(order.photos!);
        db.writeTxnSync(() => order.localPhotos.saveSync());
      } else {
        _local.cacheOrderToLocal(order);
      }

      final newOrder = await _remote.createOrder(order);

      if (newOrder != null) {
        order = order.copyWith(id: newOrder.id);
        _local.cacheOrderToLocal(order);
        await updatePhotos(order, newOrder.id!);
        order = order.copyWith(status: SyncStatus.synced);
        _local.cacheOrderToLocal(order);
      }
      return Right(Never);
    });
  }

  @override
  Future<Result<OrderEntity>> fetchOrder({required OrderEntity order}) async {
    return todo(() async {
      final thatOrder = await _remote.fetchOrder(order);
      return Right(thatOrder!);
    });
  }

  @override
  Future<Result<OrderEntity>> updateOrder({required OrderEntity order}) async {
    return todo(() async {
      final newOrder = await _remote.updateOrder(order);
      await updatePhotos(order, newOrder!.id!);
      return Right(newOrder);
    });
  }

  @override
  Future<Result<FeatureEntity?>> getOrdersNotCompleted(
      {required FeatureEntity feature}) async {
    final orders = await _local.getOrders();
    if (orders.isEmpty) {
      return Right(feature);
    }
    return Right(null);
  }

  @override
  Future<Result<Map<int, List<OrderEntity>>>> noSyncedData() {
    return todo(() async {
      final localOrders = await _local.getOrders();
      final map = localOrders.groupListsBy((element) => element.featureId!);
      map.entries.forEach(
        (element) {
          element.value
              .removeWhere((element) => element.status == SyncStatus.synced);
        },
      );
      return Right(map);
    });
  }

  @override
  Future<void> synchronized(FeatureEntity feature) async {
    final ordersNoSynced = await _local.getOrdersNoSyncedByFeature(feature.id!);

    await Future.forEach(ordersNoSynced, (order) async {
      OrderEntity? newOrder;
      if (order.id == null) {
        newOrder = await _remote.createOrder(order);
        if (newOrder != null) {
          await updatePhotos(order, newOrder.id!);
          order = order.copyWith(status: SyncStatus.synced, id: newOrder.id!);
        }
      } else {
        await updatePhotos(order, order.id!);
        order = order.copyWith(status: SyncStatus.synced, id: order.id);
      }

      _local.cacheOrderToLocal(order);
    });
  }

  Future<void> updatePhotos(OrderEntity order, int orderId) async {
    await Future.forEach(order.photos ?? order.localPhotos, (photo) async {
      if (photo.status == SyncStatus.isDeleted) {
        if (photo.id != null) {
          await _remotePhoto.deleteOrderPhoto(
              featureId: order.featureId!,
              attendanceId: order.attendanceId!,
              id: photo.id!,
              orderId: order.id!);
        }
        _localPhoto.deleteLocalPhoto(uuid: photo.dataUuid);
      }
      if (photo.status == SyncStatus.isNoSynced) {
        final resp = await _remote.createPhoto(
            photo: photo,
            featureId: order.featureId!,
            attendanceId: order.attendanceId!,
            orderId: orderId);
        if (resp != null) {
          photo = photo.copyWith(
              id: resp.id, image: resp.image, status: SyncStatus.synced);
          _local.cachePhotoToLocal(photo);
        }
      }
    });
  }
}
