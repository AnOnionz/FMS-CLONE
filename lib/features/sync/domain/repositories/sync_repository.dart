import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class SyncRepository {
  Future<Result<void>> synchronized(
      {required Map<FeatureEntity, List<DataEntity>> data});
}
