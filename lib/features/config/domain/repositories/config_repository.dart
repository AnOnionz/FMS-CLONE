import 'package:fms/features/work_place/domain/entities/config.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class ConfigRepository {
  ConfigEntity? get config;
  Future<Result<ConfigEntity?>> getConfigs(WorkPlaceEntity model);
}
