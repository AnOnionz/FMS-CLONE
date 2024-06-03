import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../statistic/domain/entities/employee_entity.dart';

class GetConfigUsecase
    extends UseCase<(ConfigEntity?, EmployeeUserEntity?), WorkPlaceEntity> {
  final GeneralRepository _repository;

  GetConfigUsecase(this._repository);
  @override
  Future<Result<(ConfigEntity?, EmployeeUserEntity?)>> call(
      WorkPlaceEntity params) async {
    return _repository.getRemoteConfig(params);
  }
}
