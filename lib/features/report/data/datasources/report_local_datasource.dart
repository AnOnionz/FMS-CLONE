import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/database/database.dart';

import '../../domain/entities/report_entity.dart';

abstract class IReportLocalDataSource {
  void cachePhotoToLocal(ReportEntity photo);
  void cachePhotosToLocal(List<ReportEntity> photos);
  List<ReportEntity> getPhotosNoSynced();
  List<ReportEntity> getPhotos();
}

class ReportLocalDataSource implements IReportLocalDataSource {
  final Database database = Database.instance;
  @override
  void cachePhotoToLocal(ReportEntity photo) {
    database.addObject<ReportEntity>(photo);
  }

  @override
  List<ReportEntity> getPhotos() {
    return database.filter<ReportEntity>(
        (filter) => filter.statusEqualTo(SyncStatus.synced));
  }

  @override
  List<ReportEntity> getPhotosNoSynced() {
    return database.filter<ReportEntity>(
        (filter) => filter.statusEqualTo(SyncStatus.noSynced));
  }

  @override
  void cachePhotosToLocal(List<ReportEntity> photos) {
    database.addObjects<ReportEntity>(photos);
  }
}
