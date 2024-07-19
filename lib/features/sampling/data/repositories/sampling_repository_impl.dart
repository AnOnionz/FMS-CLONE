import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/sampling/data/datasources/sampling_local_datasource.dart';
import 'package:fms/features/sampling/data/datasources/sampling_remote_datasource.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';
import 'package:fms/features/sampling/domain/repositories/sampling_repositoty.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/services/network_time/network_time_service.dart';
import '../../../../core/usecase/either.dart';

class SamplingRepositoryImpl extends Repository
    with GeneralDataMixin
    implements SamplingRepositoty {
  final SamplingRemoteDataSource _remote;
  final SamplingLocalDatasource _local;

  SamplingRepositoryImpl(
      {required SamplingLocalDatasource local,
      required SamplingRemoteDataSource remote})
      : _remote = remote,
        _local = local;
  @override
  Future<Result<SamplingEntity?>> getSamplings(
      {required int featureId, required int attendanceId}) async {
    return todo(() async {
      final localSamplings = await _local.getSamplingByFeature(featureId);
      if (localSamplings.isNotEmpty) {
        return Right(localSamplings.last);
      }
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
    return todo(() async {
      final time = await Modular.get<NetworkTimeService>().ntpDateTime();
      final sampling = entity.copyWith(
          dataTimestamp: time,
          dataUuid: Uuid().v1(),
          featureId: featureId,
          attendanceId: general!.attendance?.id);
      _local.cacheSamplingToLocal(sampling);
      final response = await _remote.updateSamplings(
          entity: sampling, featureId: featureId, attendanceId: attendanceId);
      if (response != null) {
        final _sampling =
            sampling.copyWith(id: response.id, status: SyncStatus.synced);
        _local.cacheSamplingToLocal(_sampling);
      }

      return Right(response);
    });
  }

  @override
  Future<Result<FeatureEntity?>> getSamplingNotCompleted(
      {required FeatureEntity feature}) {
    return todo(() async {
      final quantities = await _local.getSamplingByFeature(feature.id!);
      if (quantities.isEmpty) {
        return Right(feature);
      } else {
        return Right(null);
      }
    });
  }

  @override
  Future<Result<Map<int, List<SamplingEntity>>>> noSyncedData() async {
    return todo(() async {
      final localSamplings = await _local.getSampling();

      final map = localSamplings.groupListsBy((element) => element.featureId!);
      map.entries.forEach(
        (element) {
          element.value
              .removeWhere((element) => element.status == SyncStatus.synced);
        },
      );

      return Right(map);
    });
  }

  @override
  Future<void> synchronized(FeatureEntity feature) async {
    final samplingsNoSynced = await _local.getSamplingNoSynced(feature);

    return await Future.forEach(samplingsNoSynced, (sampling) async {
      final response = await _remote.updateSamplings(
          entity: sampling,
          attendanceId: general!.attendance!.id!,
          featureId: feature.id!);
      if (response != null) {
        final newSampling =
            sampling.copyWith(id: response.id, status: SyncStatus.synced);
        _local.cacheSamplingToLocal(newSampling);
      }
    });
  }
}
