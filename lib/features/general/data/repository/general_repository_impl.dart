import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/repository/general_repository.dart';

class GeneralRepository implements IGeneralRepository {
  GeneralEntity? general;

  @override
  Future<Result<void>> createGeneral(GeneralEntity entity) async {
    general = entity;
    return Right(Never);
  }

  @override
  Future<Result<GeneralEntity>> updateAttedanceInfo(
      AttendanceEntity? attendance) async {
    general = general?.copyWith(attendance: attendance);
    return Right(general!);
  }
}
