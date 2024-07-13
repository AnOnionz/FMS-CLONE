import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/sampling/data/datasources/sampling_remote_datasource.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';
import 'package:fms/features/sampling/domain/repositories/sampling_repositoty.dart';

import '../../../../core/usecase/either.dart';

class SamplingRepositoryImpl extends Repository implements SamplingRepositoty {
  final SamplingRemoteDataSource _remote;

  SamplingRepositoryImpl({required SamplingRemoteDataSource remote})
      : _remote = remote;
  @override
  Future<Result<SamplingEntity?>> getSamplings(
      {required int featureId, required int attendanceId}) async {
    return todo(() async {
      final samplings = await _remote.getSamplings(
          featureId: featureId, attendanceId: attendanceId);
      return Right(samplings);
    });
  }

  @override
  Future<Result<SamplingEntity?>> updateSamplings(
      {required SamplingEntity entity,
      required int featureId,
      required int attendanceId}) async {
    final samplings = await _remote.updateSamplings(
        entity: entity, featureId: featureId, attendanceId: attendanceId);
    return Right(samplings);
  }
}
