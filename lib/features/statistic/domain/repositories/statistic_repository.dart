import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class StatisticRepository {
  Future<Result<StatisticEntity>> fetchIndividualStatistic(
      {required int featureId});
  Future<Result<StatisticEntity>> fetchTeamStatistic({required int featureId});
  Future<Result<StatisticEntity>> fetchEmployeeStatistic(
      {required int featureId, required int employeeId});
  Future<Result<List<EmployeeEntity>>> fetchTeamMembers(
      {required int featureId});
}
