import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/report/data/datasources/report_local_datasource.dart';
import 'package:fms/features/report/data/datasources/report_remote_datasource.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:fms/features/report/domain/repositories/report_repository.dart';

import '../../../../core/usecase/either.dart';

class ReportRepositoryImpl extends Repository implements ReportRepository {
  final ReportRemoteDataSource _remote;
  final ReportLocalDataSource _local;

  ReportRepositoryImpl(this._remote, this._local);
  @override
  Future<Result<List<ReportEntity>>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    return todo(() async {
      final photos =
          await _remote.allPhotos(general: general, feature: feature);
      return Right(photos);
    });
  }

  @override
  Future<Result<List<ReportEntity>>> createPhotos(
      {required List<ReportEntity> photos,
      required GeneralEntity general,
      required FeatureEntity feature}) async {
    return todo(
      () async {
        final List<ReportEntity> _resp = [];
        for (final ReportEntity photo in photos) {
          if (photo.status == SyncStatus.noSynced) {
            final report = await _remote.createPhoto(
                photo: photo, general: general, feature: feature);
            photo.status = SyncStatus.synced;

            if (report != null) {
              photo.image = report.image;
              _resp.add(report);
            }
            _local.cachePhotoToLocal(photo);
          }
        }
        return Right(_resp);
      },
      onFailure: (failure) {
        _local.cachePhotosToLocal(photos);
      },
    );
  }
}
