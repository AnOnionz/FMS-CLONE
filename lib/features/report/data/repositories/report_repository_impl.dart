import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/report/data/datasources/report_local_datasource.dart';
import 'package:fms/features/report/data/datasources/report_remote_datasource.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/report/domain/repositories/report_repository.dart';

import '../../../../core/usecase/either.dart';

class ReportRepositoryImpl extends Repository
    with GeneralDataMixin
    implements ReportRepository {
  final ReportRemoteDataSource _remote;
  final ReportLocalDataSource _local;

  ReportRepositoryImpl(this._remote, this._local);
  @override
  Future<Result<List<PhotoEntity>>> allPhotos(
      {required FeatureEntity feature}) async {
    return todo(() async {
      final localPhotos = await _local.getPhotosLocal();
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
        }
        _local.cachePhotosToLocal(photos);
        return Right(_resp);
      },
      onFailure: (failure) {
        _local.cachePhotosToLocal(photos);
      },
    );
  }

  @override
  Future<Result<FeatureEntity?>> getPhotosNotCompleted(
      {required FeatureEntity feature}) {
    return todo(() async {
      final localPhotos = await _local.getPhotosLocal();
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
      final localPhotos = _local.getPhotosNoSynced();
      if (localPhotos.isNotEmpty) {
        return Right(true);
      }
      return Right(false);
    });
  }
}
