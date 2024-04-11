import 'package:fms/core/constant/type_def.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';
import '../entities/report_entity.dart';

abstract class ReportRepository {
  Future<Result<List<ReportEntity>>> createPhotos(
      {required List<ReportEntity> photos,
      required GeneralEntity general,
      required FeatureEntity feature});
  Future<Result<List<ReportEntity>>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature});
}
