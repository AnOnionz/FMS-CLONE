import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class WorkPlaceRepository {
  Future<Result<void>> getProjects();
  Future<Result<void>> getOutletsOfProject(WorkPlaceEntity model);
  Future<Result<void>> getBoothsOfOutlet(WorkPlaceEntity model);
  Future<Result<void>> getConfigs(WorkPlaceEntity model);
}
