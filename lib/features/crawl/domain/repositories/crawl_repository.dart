import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';

abstract class CrawlRepository {
  Future<Result<CrwalQuantityEntity?>> getQuantities(
      {required FeatureEntity feature});
  Future<Result<CrwalQuantityEntity>> crawlQuantities({
    required CrwalQuantityEntity quantities,
    required FeatureEntity feature,
  });
  Future<Result<FeatureEntity?>> getQuantitiesNotCompleted(
      {required FeatureEntity feature});
  Future<Result<List<CrwalQuantityEntity>>> noSyncedData();
  Future<void> synchronized();
}
