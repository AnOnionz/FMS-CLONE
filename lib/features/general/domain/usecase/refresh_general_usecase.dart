import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

class RefreshGeneralUseCase extends UseCase<GeneralEntity, AttendanceEntity> {
  final GeneralRepository repository;

  RefreshGeneralUseCase(this.repository);
  @override
  Future<Result<GeneralEntity>> call(AttendanceEntity params) {
    return repository.refreshGenaral(params);
  }
}
