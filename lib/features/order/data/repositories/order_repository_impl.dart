import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/data_source/local_data_source.dart';
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
    }, useInternet: true);
  }

  @override
  Future<Result<List<OrderEntity>>> allOrders({required int featureId}) async {
    return todo(() async {
      final Set<OrderEntity> orders = {};
      final offlineOrders = await _local.getOrdersByFeature(featureId);
      await allOnlineOrders(featureId: featureId)
        ..fold((failure) {
          orders.addAll(offlineOrders);
        }, (onlineOrders) {
          orders.addAll([...onlineOrders, ...offlineOrders].toSet());
        });

      return Right(orders.sorted((a, b) =>
          b.dataTimestamp.millisecondsSinceEpoch -
          a.dataTimestamp.millisecondsSinceEpoch));
    });
  }

  Future<Result<List<OrderEntity>>> allOnlineOrders(
      {required int featureId}) async {
    return todo(() async {
      final onlineOrders = await _remote.fetchOrders(
          featureId: featureId, attendanceId: general.attendance!.id!);

      return Right(onlineOrders);
    }, useInternet: true);
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

      return await requestCreateOrder(order: order)
        ..fold((failure) => Right(Never), (newOrder) async {
          if (newOrder != null) {
            order = order.copyWith(id: newOrder.id);
            _local.cacheOrderToLocal(order);
            await updatePhotos(order, newOrder.id!);
            order = order.copyWith(status: SyncStatus.synced);
            _local.cacheOrderToLocal(order);
          }
        });
    });
  }

  Future<Result<OrderEntity?>> requestCreateOrder(
      {required OrderEntity order}) {
    return todo(() async {
      final newOrder = await _remote.createOrder(order);

      if (newOrder != null) {
        return Right(newOrder);
      }
      return Right(null);
    }, useInternet: true);
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
      final existOrder = await _local.getOrderByUuid(order.dataUuid);
      if (existOrder != null) {
        _local.cacheOrderToLocal(newOrder.copyWith(
            attendanceId: order.attendanceId,
            featureId: order.featureId,
            exchanges: existOrder.exchanges?.map((e) {
              final copy = order.exchanges!.firstWhere((element) =>
                  element.featureSchemeExchangeId == e.featureSchemeExchangeId);
              return e.copyWith(quantity: copy.quantity);
            }).toList(),
            purchases: existOrder.purchases?.map((e) {
              final copy = order.purchases!.firstWhere((element) =>
                  element.featureOrderProductId == e.featureOrderProductId);
              return e.copyWith(quantity: copy.quantity);
            }).toList(),
            samplings: existOrder.samplings?.map((e) {
              final copy = order.samplings!.firstWhere((element) =>
                  element.featureSamplingId == e.featureSamplingId);
              return e.copyWith(quantity: copy.quantity);
            }).toList()));
      }

      return Right(newOrder);
    }, useInternet: true);
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
    try {
      await Future.forEach(order.photos ?? order.localPhotos!, (photo) async {
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
    } catch (e) {
      rethrow;
    }
  }
}
