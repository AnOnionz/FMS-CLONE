import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class WorkPlaceRepository {
  Future<Result<List<ProjectEntity>>> getProjects();
  Future<Result<List<OutletEntity>>> getOutletsOfProject(WorkPlaceEntity model);
  Future<Result<List<BoothEntity>>> getBoothsOfOutlet(WorkPlaceEntity model);
}
