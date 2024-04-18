import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';

import '../../../../core/services/network_time/network_time_service.dart';

abstract class ICrawlLocalDatasource {
  void cacheQuantitiesToLocal(CrwalQuantityEntity entity);
  Future<CrwalQuantityEntity?> getQuantities();
}

class CrawlLocalDatasource
    with LocalDatasource
    implements ICrawlLocalDatasource {
  @override
  void cacheQuantitiesToLocal(CrwalQuantityEntity entity) {
    db.addObject<CrwalQuantityEntity>(entity);
  }

  @override
  Future<CrwalQuantityEntity?> getQuantities() async {
    final networkTimeService = Modular.get<NetworkTimeService>();
    final ntpTime = await networkTimeService.ntpDateTime();
    final time = networkTimeService.betweenTime(ntpTime);
    return db.getObject(
        id: fastHash(time.today.dMy().millisecondsSinceEpoch.toString()));
  }
}
