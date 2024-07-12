import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

class GetUserInfoUsecase extends UseCase<EmployeeEntity?, void> {
  final ProfileRepositoryImpl _repository;

  GetUserInfoUsecase(this._repository);
  @override
  Future<Result<EmployeeEntity?>> call([void params]) async {
    return await _repository.getUserInfo();
  }
}
