import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/attendance_repository_impl.dart';
import 'attendance_usecase.dart';

class GetAttendanceInfoUsecase
    extends UseCase<AttendanceEntity?, AttendanceParams> {
  final AttendanceRepositoryImpl repository;

  GetAttendanceInfoUsecase(this.repository);

  @override
  Future<Result<AttendanceEntity?>> call(params) {
    return repository.getAttendanceInfo(
        feature: params.feature, general: params.general);
  }
}
