import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/attendance_repository_impl.dart';

class GetAttendanceReportsUsecase
    extends UseCase<List<AttendanceEntity>, FeatureEntity> {
  final AttendanceRepositoryImpl repository;

  GetAttendanceReportsUsecase(this.repository);

  @override
  Future<Result<List<AttendanceEntity>>> call(FeatureEntity params) {
    return repository.getAttendanceReports(feature: params);
  }
}
