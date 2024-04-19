import 'dart:typed_data';

import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/datasource/images_remote_datasource.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/photo_entity.dart';

abstract class IReportRemoteDataSource {
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo, required GeneralEntity general});
  Future<List<PhotoEntity>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature});
}

class ReportRemoteDataSource extends ImagesRemoteDataSource
    implements IReportRemoteDataSource {
  ReportRemoteDataSource(super.dio);

  @override
  Future<List<PhotoEntity>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/photos');

    return parseListJson<PhotoEntity>((
      listJson: _resp,
      fromJson: PhotoEntity.fromMap,
    ));
  }

  @override
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo, required GeneralEntity general}) async {
    Map<String, dynamic> formData;

    if (photo.image != null) {
      formData = {
        'dataUuid': photo.dataUuid,
        'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
        'featurePhotoId': photo.featurePhotoId,
        'imageId': photo.image!.id,
      };
    } else {
      final imageUploadModel = await uploadImageToServer(XFile(photo.path!));
      if (imageUploadModel != null) {
        formData = {
          'dataUuid': photo.dataUuid,
          'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
          'featurePhotoId': photo.featurePhotoId,
          'imageId': imageUploadModel.id,
        };
      } else {
        return null;
      }
    }

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${photo.featureId}/photos',
        data: formData);
    return parseJson<PhotoEntity>((json: _resp, fromJson: PhotoEntity.fromMap));
  }
}
