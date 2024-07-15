import 'package:fms/core/constant/type_def.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../entities/sampling_entity.dart';

abstract class SamplingRepositoty {
  Future<Result<SamplingEntity?>> getSamplings(
      {required int featureId, required int attendanceId});
  Future<Result<SamplingEntity?>> updateSamplings(
      {required SamplingEntity entity,
      required int featureId,
      required int attendanceId});
  Future<Result<FeatureEntity?>> getSamplingNotCompleted(
      {required FeatureEntity feature});
  Future<Result<Map<int, List<SamplingEntity>>>> noSyncedData();
  Future<void> synchronized(FeatureEntity feature);
}
