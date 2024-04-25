import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/crawl/data/datasources/crawl_local_datasource.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/crawl/domain/repositories/crawl_repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../../core/usecase/either.dart';
import '../datasources/crawl_remote_datasource.dart';

class CrawlRepositoryImpl extends Repository
    with GeneralDataMixin
    implements CrawlRepository {
  final CrawlLocalDatasource _local;
  final CrawlRemoteDatasource _remote;

  CrawlRepositoryImpl(this._local, this._remote);
  @override
  Future<Result<CrawlQuantityEntity>> crawlQuantities({
    required CrawlQuantityEntity quantities,
    required FeatureEntity feature,
  }) {
    return todo(
      () async {
        final time = await Modular.get<NetworkTimeService>().ntpDateTime();
        quantities = quantities.copyWith(
            dataTimestamp: time,
            dataUuid: Uuid().v1(),
            featureId: feature.id,
            attendanceId: general.attendance?.id);
        final response = await _remote.crwalQuantities(
            quantities: quantities, general: general);
        if (response != null) {
          quantities =
              quantities.copyWith(id: response.id, status: SyncStatus.synced);
        }
        _local.cacheQuantitiesToLocal(quantities);
        return Right(quantities);
      },
      onFailure: (failure) {
        _local.cacheQuantitiesToLocal(quantities);
      },
    );
  }

  @override
  Future<Result<CrawlQuantityEntity?>> getQuantities(
      {required FeatureEntity feature}) async {
    return todo(() async {
      final localCrawlQuantities = await _local.getQuantitiesByFeature(feature);
      if (localCrawlQuantities.isNotEmpty) {
        return Right(localCrawlQuantities.last);
      }
      final crawlQuantities =
          await _remote.getQuantities(general: general, feature: feature);
      return Right(crawlQuantities);
    });
  }

  @override
  Future<Result<FeatureEntity?>> getQuantitiesNotCompleted(
      {required FeatureEntity feature}) async {
    return todo(() async {
      final quantities = await _local.getQuantitiesByFeature(feature);
      if (quantities.isEmpty) {
        return Right(feature);
      } else {
        return Right(null);
      }
    });
  }

  @override
  Future<Result<Map<int, List<CrawlQuantityEntity>>>> noSyncedData() async {
    return todo(() async {
      final localPhotos = await _local.getQuantities();

      final map = localPhotos.groupListsBy((element) => element.featureId!);
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
    final quantitiesNoSynced = await _local.getQuantitiessNoSynced(feature);

    return await Future.forEach(quantitiesNoSynced, (quantities) async {
      final response = await _remote.crwalQuantities(
          quantities: quantities, general: general);
      if (response != null) {
        quantities =
            quantities.copyWith(id: response.id, status: SyncStatus.synced);
        _local.cacheQuantitiesToLocal(quantities);
      }
    });
  }
}
