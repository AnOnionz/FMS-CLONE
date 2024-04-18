import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/photo_entity.dart';

abstract class IReportLocalDataSource {
  void cachePhotoToLocal(PhotoEntity photo);
  void cachePhotosToLocal(List<PhotoEntity> photos);
  List<PhotoEntity> getPhotosNoSynced();
  Future<List<PhotoEntity>> getPhotosLocal();
}

class ReportLocalDataSource extends LocalDatasource
    with GeneralDataMixin
    implements IReportLocalDataSource {
  @override
  void cachePhotoToLocal(PhotoEntity photo) {
    db.addObject<PhotoEntity>(photo);
  }

  @override
  Future<List<PhotoEntity>> getPhotosLocal() async {
    final time = await Modular.get<NetworkTimeService>().todayRangeDate();
    return db.filter<PhotoEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .sortByDataTimestamp()
        .build());
  }

  @override
  List<PhotoEntity> getPhotosNoSynced() {
    return db.filter<PhotoEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .statusEqualTo(SyncStatus.noSynced)
        .build());
  }

  @override
  void cachePhotosToLocal(List<PhotoEntity> photos) {
    db.addObjects<PhotoEntity>(photos);
  }
}
