import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/report/data/datasources/report_local_datasource.dart';
import 'package:fms/features/report/data/datasources/report_remote_datasource.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/report/domain/repositories/report_repository.dart';

import '../../../../core/usecase/either.dart';

class ReportRepositoryImpl extends Repository implements ReportRepository {
  final ReportRemoteDataSource _remote;
  final ReportLocalDataSource _local;

  ReportRepositoryImpl(this._remote, this._local);
  @override
  Future<Result<List<PhotoEntity>>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    return todo(() async {
      final localPhotos = await _local.getPhotos(general: general);
      if (localPhotos.isNotEmpty) {
        return Right(localPhotos);
      }
      final photos =
          await _remote.allPhotos(general: general, feature: feature);
      return Right(photos);
    });
  }

  @override
  Future<Result<List<PhotoEntity>>> createPhotos(
      {required List<PhotoEntity> photos,
      required GeneralEntity general,
      required FeatureEntity feature}) async {
    return todo(
      () async {
        final List<PhotoEntity> _resp = [];
        for (PhotoEntity photo in photos) {
          if (photo.status == SyncStatus.noSynced) {
            final report = await _remote.createPhoto(
                photo: photo, general: general, feature: feature);
            photo = photo.copyWith(status: SyncStatus.synced);
            if (report != null) {
              photo = photo.copyWith(id: report.id, image: report.image);
            }
          }
          photo = photo.copyWith(attendanceId: general.attendance!.id);

          _local.cachePhotoToLocal(photo);
        }
        return Right(_resp);
      },
      onFailure: (failure) {
        photos.forEach((photo) {
          photo = photo.copyWith(attendanceId: general.attendance!.id);
          _local.cachePhotoToLocal(photo);
        });
      },
    );
  }

  @override
  Future<Result<FeatureEntity?>> getPhotosNotCompleted(
      {required GeneralEntity general, required FeatureEntity feature}) {
    return todo(() async {
      final localPhotos = await _local.getPhotos(general: general);
      if (localPhotos.isEmpty) {
        final reportFeature = feature.copyWith(featurePhotos: []);
        return Right(reportFeature);
      }
      if (localPhotos.isNotEmpty) {
        final featurePhotos = <FeaturePhoto>[];
        final photoGroup = groupBy<PhotoEntity, int>(
          localPhotos,
          (photo) {
            return photo.featurePhotoId;
          },
        );

        feature.featurePhotos!.forEach((featurePhoto) {
          final photos = photoGroup[featurePhoto.id!] ?? [];
          if (photos.length < featurePhoto.minimum!) {
            featurePhotos.add(featurePhoto);
          }
        });
        if (featurePhotos.length > 0) {
          return Right(feature.copyWith(featurePhotos: featurePhotos));
        }
      }

      return Right(null);
    });
  }

  @override
  Future<Result<bool>> hasNoSyncedData({required GeneralEntity general}) async {
    return todo(() async {
      final localPhotos = await _local.getPhotos(general: general);
      if (localPhotos.isNotEmpty) {
        final hasNoSynced =
            localPhotos.any((photo) => photo.status == SyncStatus.noSynced);
        return Right(hasNoSynced);
      }
      return Right(false);
    });
  }
}
