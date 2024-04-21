import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/images/data/datasource/delete_image_remote_datasource.dart';
import 'package:fms/features/images/domain/repositories/delete_image_repository.dart';

import '../../../../core/usecase/either.dart';
import '../datasource/delete_image_local_remote_datasource.dart';

class DeletePhotoRepositoryImpl extends Repository
    with GeneralDataMixin
    implements DeleteImageRepository {
  final DeletePhotoRemoteDataSource _remote;
  final DeletePhotoLocalDataSource _local;

  DeletePhotoRepositoryImpl(this._remote, this._local);

  @override
  Future<Result<void>> deletePhoto(
      {required FeatureEntity feature,
      required int id,
      required String uuid,
      String? noteUuid}) async {
    return todo(() async {
      if (feature.type == FeatureType.photography) {
        await _remote.deletePhoto(feature: feature, general: general, id: id);
      }
      if (feature.type ==
          FeatureType.multiSubjectMultimediaInformationCapturing) {
        await _remote.deleteNotePhoto(
            feature: feature, general: general, id: id);
      }
      await _local.deleteLocalPhoto(uuid: uuid);
      return Right(Never);
    });
  }

  @override
  Future<Result<void>> deleteLocalPhoto(
      {required String uuid, String? noteUuid}) async {
    return todo(() async {
      await _local.deleteLocalPhoto(uuid: uuid);

      return Right(Never);
    });
  }
}
