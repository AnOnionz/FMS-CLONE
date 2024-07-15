import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:isar/isar.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/presentation/page/mixin_general.dart';
import '../../domain/entities/sampling_entity.dart';

abstract class ISamplingLocalDatasource {
  void cacheSamplingToLocal(SamplingEntity entity);
  Future<List<SamplingEntity>> getSampling();
  Future<List<SamplingEntity>> getSamplingByFeature(int featureId);
  Future<List<SamplingEntity>> getSamplingNoSynced(FeatureEntity feature);
}

class SamplingLocalDatasource
    with LocalDatasource, GeneralDataMixin
    implements ISamplingLocalDatasource {
  @override
  void cacheSamplingToLocal(SamplingEntity entity) {
    db.addObject<SamplingEntity>(entity);
  }

  @override
  Future<List<SamplingEntity>> getSamplingByFeature(int featureId) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<SamplingEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .featureIdEqualTo(featureId)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<SamplingEntity>> getSamplingNoSynced(
      FeatureEntity feature) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<SamplingEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .featureIdEqualTo(feature.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.isNoSynced)
        .build());
  }

  @override
  Future<List<SamplingEntity>> getSampling() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<SamplingEntity>((filter) => filter
        .attendanceIdEqualTo(general!.attendance?.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }
}
