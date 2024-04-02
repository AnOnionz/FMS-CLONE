import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/usecase/either.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/work_place_repository.dart';
import '../datasources/work_place_datasource.dart';

class WorkPlaceRepositoryImpl extends Repository
    implements WorkPlaceRepository {
  final WorkPlaceDatasource dataSource;

  WorkPlaceRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<BoothEntity>>> getBoothsOfOutlet(WorkPlaceEntity model) {
    return todo(() async {
      final booths = await dataSource.getBoothsOfOutlet(model);
      return Right(booths);
    });
  }

  @override
  Future<Result<List<OutletEntity>>> getOutletsOfProject(
      WorkPlaceEntity model) {
    return todo(() async {
      final outlets = await dataSource.getOutletsOfProject(model);
      return Right(outlets);
    });
  }

  @override
  Future<Result<List<ProjectEntity>>> getProjects() {
    return todo(() async {
      final projects = await dataSource.getProjects();
      return Right(projects);
    });
  }
}
