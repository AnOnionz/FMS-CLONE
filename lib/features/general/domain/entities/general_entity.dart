// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../work_place/domain/entities/booth_entity.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';

part 'general_entity.g.dart';

@collection
class GeneralEntity {
  Id get isarId => fastHash(config.versionId!.toString());
  final ProjectEntity project;
  final OutletEntity outlet;
  final BoothEntity booth;
  final ConfigEntity config;
  final AttendanceEntity? attendance;

  GeneralEntity({
    required this.project,
    required this.outlet,
    required this.booth,
    required this.config,
    this.attendance,
  });

  GeneralEntity copyWith({
    ProjectEntity? project,
    OutletEntity? outlet,
    BoothEntity? booth,
    ConfigEntity? config,
    AttendanceEntity? attendance,
  }) {
    return GeneralEntity(
      project: project ?? this.project,
      outlet: outlet ?? this.outlet,
      booth: booth ?? this.booth,
      config: config ?? this.config,
      attendance: attendance ?? this.attendance,
    );
  }

  @override
  String toString() {
    return 'GeneralEntity(project: $project, outlet: $outlet, booth: $booth, config: $config, attendance: $attendance)';
  }
}
