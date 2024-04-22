import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/crawl/data/datasources/crawl_local_datasource.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/crawl/domain/repositories/crawl_repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';

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
        quantities = quantities.copyWith(
            featureId: feature.id, attendanceId: general.attendance?.id);
        final response = await _remote.crwalQuantities(
            quantities: quantities, general: general);
        if (response != null) {
          quantities =
              quantities.copyWith(id: response.id, status: SyncStatus.synced);
        }
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
      final localCrawlQuantities = await _local.getQuantities();
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
      final quantities = await _local.getQuantities();
      if (quantities.isEmpty) {
        return Right(feature);
      } else {
        return Right(null);
      }
    });
  }

  @override
  Future<Result<List<CrawlQuantityEntity>>> noSyncedData() async {
    return todo(() async {
      final quantities = await _local.getQuantitiessNoSynced();
      return Right(quantities);
    });
  }

  @override
  Future<void> synchronized() async {
    final quantitiesNoSynced = await _local.getQuantitiessNoSynced();

    await Future.forEach(quantitiesNoSynced, (quantities) async {
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
