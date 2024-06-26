// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../statistic/domain/entities/employee_entity.dart';
import '../../../work_place/domain/entities/booth_entity.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';

part 'general_entity.g.dart';

@collection
class GeneralEntity {
  Id get isarId => fastHash(identifer);
  final String identifer;
  final ProjectEntity project;
  final OutletEntity outlet;
  final ConfigEntity config;
  final BoothEntity booth;
  final AttendanceEntity? attendance;
  final DateTime createdDate;

  GeneralEntity({
    required this.identifer,
    required this.project,
    required this.outlet,
    required this.booth,
    required this.config,
    this.attendance,
    required this.createdDate,
  });

  GeneralEntity copyWith(
      {ProjectEntity? project,
      OutletEntity? outlet,
      BoothEntity? booth,
      ConfigEntity? config,
      AttendanceEntity? attendance,
      String? identifer,
      EmployeeUserEntity? user}) {
    return GeneralEntity(
        identifer: identifer ?? this.identifer,
        project: project ?? this.project,
        outlet: outlet ?? this.outlet,
        booth: booth ?? this.booth,
        config: config ?? this.config,
        attendance: attendance ?? this.attendance,
        createdDate: createdDate);
  }

  @override
  String toString() {
    return 'GeneralEntity(identifer: $identifer, project: $project, outlet: $outlet, config: $config, booth: $booth, attendance: $attendance, createdDate: $createdDate)';
  }
}
