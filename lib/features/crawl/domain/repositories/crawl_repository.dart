import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';

abstract class CrawlRepository {
  Future<Result<CrwalQuantityEntity>> getQuantities(
      {required GeneralEntity general, required FeatureEntity feature});
  Future<Result<CrwalQuantityEntity>> crawlQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general,
      required FeatureEntity feature});
}
