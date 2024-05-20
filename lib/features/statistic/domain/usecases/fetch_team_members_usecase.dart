import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import '../../data/repositories/statistic_repository_impl.dart';

class FetchTeamMembersUseCase extends UseCase<List<EmployeeEntity>, int> {
  final StatisticRepositoryImpl _repository;

  FetchTeamMembersUseCase(this._repository);
  @override
  Future<Result<List<EmployeeEntity>>> call(int params) {
    return _repository.fetchTeamMembers(featureId: params);
  }
}
