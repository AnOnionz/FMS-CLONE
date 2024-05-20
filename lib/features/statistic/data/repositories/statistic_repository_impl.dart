import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/statistic/data/datasources/statistic_remote_datasource.dart';

import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';

import '../../domain/repositories/statistic_repository.dart';

class StatisticRepositoryImpl extends Repository
    implements StatisticRepository {
  final StatisticRemoteDataSource _remote;

  StatisticRepositoryImpl(this._remote);

  @override
  Future<Result<StatisticEntity>> fetchEmployeeStatistic(
      {required int featureId, required int employeeId}) {
    return todo(() async {
      final statistic = await _remote.fetchTeamStatistic(
          featureId: featureId, employeeId: employeeId);
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }

  @override
  Future<Result<StatisticEntity>> fetchIndividualStatistic(
      {required int featureId}) {
    return todo(() async {
      final statistic =
          await _remote.fetchIndividualStatistic(featureId: featureId);
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }

  @override
  Future<Result<List<EmployeeEntity>>> fetchTeamMembers(
      {required int featureId}) {
    return todo(() async {
      final members = await _remote.fetchTeamMembers(featureId: featureId);

      return Right(members);
    });
  }

  @override
  Future<Result<StatisticEntity>> fetchTeamStatistic({required int featureId}) {
    return todo(() async {
      final statistic = await _remote.fetchTeamStatistic(featureId: featureId);
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }
}
