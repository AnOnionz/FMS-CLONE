import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';

class WorkPlaceEntity {
  final ProjectEntity? project;
  final OutletEntity? outlet;
  final BoothEntity? booth;
  WorkPlaceEntity({
    required this.project,
    required this.outlet,
    required this.booth,
  });

  WorkPlaceEntity copyWith({
    ProjectEntity? project,
    OutletEntity? outlet,
    BoothEntity? booth,
  }) {
    return WorkPlaceEntity(
      project: project ?? this.project,
      outlet: outlet ?? this.outlet,
      booth: booth ?? this.booth,
    );
  }

  @override
  String toString() =>
      'WorkPlaceEntity(project: $project, outlet: $outlet, booth: $booth)';
}
