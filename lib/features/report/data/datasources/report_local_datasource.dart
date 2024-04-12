import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/utilities/parser.dart';

import '../../domain/entities/report_entity.dart';

abstract class IReportLocalDataSource {
  void cachePhotoToLocal(ReportEntity photo);
  void cachePhotosToLocal(List<ReportEntity> photos);
  List<ReportEntity> getPhotosNoSynced();
  List<ReportEntity> getPhotos();
}

class ReportLocalDataSource extends LocalDatasource
    implements IReportLocalDataSource {
  @override
  void cachePhotoToLocal(ReportEntity photo) {
    final oldPhoto = db.getObject<ReportEntity>(id: fastHash(photo.dataUuid));
    if (oldPhoto != null) {
      oldPhoto.path = photo.path;
      oldPhoto.image = photo.image;
      oldPhoto.dataTimestamp = photo.dataTimestamp;
      oldPhoto.status = photo.status;
      oldPhoto.id = photo.id;
      db.addObject<ReportEntity>(oldPhoto);
    } else
      db.addObject<ReportEntity>(photo);
  }

  @override
  List<ReportEntity> getPhotos() {
    return db.filter<ReportEntity>(
        (filter) => filter.statusEqualTo(SyncStatus.synced));
  }

  @override
  List<ReportEntity> getPhotosNoSynced() {
    return db.filter<ReportEntity>(
        (filter) => filter.statusEqualTo(SyncStatus.noSynced));
  }

  @override
  void cachePhotosToLocal(List<ReportEntity> photos) {
    db.addObjects<ReportEntity>(photos);
  }
}
