import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/photo_entity.dart';

abstract class IReportLocalDataSource {
  void cachePhotoToLocal(PhotoEntity photo);
  void cachePhotosToLocal(List<PhotoEntity> photos);
  List<PhotoEntity> getPhotosNoSynced();
  Future<List<PhotoEntity>> getPhotos();
}

class ReportLocalDataSource extends LocalDatasource
    implements IReportLocalDataSource {
  @override
  void cachePhotoToLocal(PhotoEntity photo) {
    final oldPhoto = db.getObject<PhotoEntity>(id: fastHash(photo.dataUuid));
    if (oldPhoto != null) {
      oldPhoto.path = photo.path;
      oldPhoto.image = photo.image;
      oldPhoto.dataTimestamp = photo.dataTimestamp;
      oldPhoto.status = photo.status;
      oldPhoto.id = photo.id;
      db.addObject<PhotoEntity>(oldPhoto);
    } else
      db.addObject<PhotoEntity>(photo);
  }

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    final time = await Modular.get<NetworkTimeService>().todayRangeDate();

    return db.filter<PhotoEntity>((filter) => filter
        .dataTimestampBetween(time.yesterday, time.today)
        .sortByDataTimestamp()
        .build());
  }

  @override
  List<PhotoEntity> getPhotosNoSynced() {
    return db.filter<PhotoEntity>(
        (filter) => filter.statusEqualTo(SyncStatus.noSynced).build());
  }

  @override
  void cachePhotosToLocal(List<PhotoEntity> photos) {
    db.addObjects<PhotoEntity>(photos);
  }
}
