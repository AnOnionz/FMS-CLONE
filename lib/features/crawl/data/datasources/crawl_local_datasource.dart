import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/presentation/page/mixin_general.dart';

abstract class ICrawlLocalDatasource {
  void cacheQuantitiesToLocal(CrawlQuantityEntity entity);
  Future<List<CrawlQuantityEntity>> getQuantities();
  Future<List<CrawlQuantityEntity>> getQuantitiesByFeature(
      FeatureEntity feature);
  Future<List<CrawlQuantityEntity>> getQuantitiessNoSynced(
      FeatureEntity feature);
}

class CrawlLocalDatasource
    with LocalDatasource, GeneralDataMixin
    implements ICrawlLocalDatasource {
  @override
  void cacheQuantitiesToLocal(CrawlQuantityEntity entity) {
    db.addObject<CrawlQuantityEntity>(entity);
  }

  @override
  Future<List<CrawlQuantityEntity>> getQuantitiesByFeature(
      FeatureEntity feature) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<CrawlQuantityEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .featureIdEqualTo(feature.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<CrawlQuantityEntity>> getQuantitiessNoSynced(
      FeatureEntity feature) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<CrawlQuantityEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .featureIdEqualTo(feature.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.isNoSynced)
        .build());
  }

  @override
  Future<List<CrawlQuantityEntity>> getQuantities() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<CrawlQuantityEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }
}
