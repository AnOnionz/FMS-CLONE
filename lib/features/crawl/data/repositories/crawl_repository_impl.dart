import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/crawl/data/datasources/crawl_local_datasource.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/crawl/domain/repositories/crawl_repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/usecase/either.dart';
import '../datasources/crawl_remote_datasource.dart';

class CrawlRepositoryImpl extends Repository implements CrawlRepository {
  final CrawlLocalDatasource _local;
  final CrawlRemoteDatasource _remote;

  CrawlRepositoryImpl(this._local, this._remote);
  @override
  Future<Result<CrwalQuantityEntity>> crawlQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general,
      required FeatureEntity feature}) {
    return todo(
      () async {
        final response = await _remote.crwalQuantities(
            quantities: quantities, general: general, feature: feature);
        if (response != null) {
          quantities = quantities.copyWith(
              dataTimestamp: response.dataTimestamp,
              dataUuid: response.dataUuid,
              id: response.id);
        }
        return Right(quantities);
      },
      onFinally: () {
        _local.cacheQuantitiesToLocal(quantities);
      },
    );
  }

  @override
  Future<Result<CrwalQuantityEntity>> getQuantities(
      {required GeneralEntity general, required FeatureEntity feature}) {
    // TODO: implement getQuantities
    throw UnimplementedError();
  }
}
