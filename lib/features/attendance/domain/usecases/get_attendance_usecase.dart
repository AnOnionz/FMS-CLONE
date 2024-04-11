import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/attendance_repository_impl.dart';
import 'attendance_usecase.dart';

class GetAttendanceInfoUsecase extends UseCase<AttendanceEntity?, void> {
  final GeneralRepository repository;

  GetAttendanceInfoUsecase(this.repository);

  @override
  Future<Result<AttendanceEntity?>> call([void params]) {
    return repository.getAttedanceInfo();
  }
}
