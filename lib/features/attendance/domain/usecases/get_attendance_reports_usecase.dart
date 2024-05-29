import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';

class GetAttendanceReportsUsecase
    extends UseCase<List<AttendanceEntity>, FeatureEntity> {
  final AttendanceRepository repository;

  GetAttendanceReportsUsecase(this.repository);

  @override
  Future<Result<List<AttendanceEntity>>> call(FeatureEntity params) {
    return repository.getAttendanceReports(feature: params);
  }
}
