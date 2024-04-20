import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../general/presentation/page/mixin_general.dart';

abstract class ICrawlLocalDatasource {
  void cacheQuantitiesToLocal(CrwalQuantityEntity entity);
  Future<List<CrwalQuantityEntity>> getQuantities();
  Future<List<CrwalQuantityEntity>> getQuantitiessNoSynced();
}

class CrawlLocalDatasource
    with LocalDatasource, GeneralDataMixin
    implements ICrawlLocalDatasource {
  @override
  void cacheQuantitiesToLocal(CrwalQuantityEntity entity) {
    db.addObject<CrwalQuantityEntity>(entity);
  }

  @override
  Future<List<CrwalQuantityEntity>> getQuantities() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<CrwalQuantityEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<CrwalQuantityEntity>> getQuantitiessNoSynced() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<CrwalQuantityEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.noSynced)
        .build());
  }
}
