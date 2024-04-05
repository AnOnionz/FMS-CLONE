import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';

import '../../../work_place/domain/entities/booth_entity.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';

class GeneralEntity {
  final ProjectEntity project;
  final OutletEntity outlet;
  final BoothEntity booth;
  final ConfigEntity config;

  GeneralEntity(
      {required this.project,
      required this.outlet,
      required this.booth,
      required this.config});
}
