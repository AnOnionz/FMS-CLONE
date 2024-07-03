import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/datasource/images_remote_datasource.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/note_entity.dart';

abstract class INoteRemoteDataSource {
  Future<NoteEntity?> createNote(
      {required NoteEntity note, required GeneralEntity general});
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo,
      required FeatureEntity feature,
      required GeneralEntity general});
  Future<List<NoteEntity>> allNotes(
      {required GeneralEntity general, required FeatureEntity feature});
  Future<List<PhotoEntity>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature});
}

class NoteRemoteDataSource extends ImagesRemoteDataSource
    implements INoteRemoteDataSource {
  @override
  Future<List<NoteEntity>> allNotes(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/multimedias');

    return parseListJson<NoteEntity>((
      listJson: _resp,
      fromJson: NoteEntity.fromMap,
    ));
  }

  @override
  Future<NoteEntity?> createNote(
      {required NoteEntity note, required GeneralEntity general}) async {
    final formData = note.toMap();

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${note.featureId}/multimedias',
        data: formData);
    return parseJson<NoteEntity>((json: _resp, fromJson: NoteEntity.fromMap));
  }

  @override
  Future<PhotoEntity?> createPhoto(
      {required PhotoEntity photo,
      required FeatureEntity feature,
      required GeneralEntity general}) async {
    Map<String, dynamic> formData;
    if (photo.image != null) {
      formData = {
        'dataUuid': photo.dataUuid,
        'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
        'featureMultimediaId': photo.featurePhotoId,
        'imageId': photo.image!.id,
      };
    } else {
      final imageUploadModel = await uploadImageToServer(XFile(photo.path!));
      if (imageUploadModel != null) {
        formData = {
          'dataUuid': photo.dataUuid,
          'dataTimestamp': photo.dataTimestamp.toUtc().toIso8601String(),
          'featureMultimediaId': photo.featurePhotoId,
          'imageId': imageUploadModel.id,
        };
      } else {
        return null;
      }
    }

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/multimedias/photos',
        data: formData);
    return parseJson<PhotoEntity>((json: _resp, fromJson: PhotoEntity.fromMap));
  }

  @override
  Future<List<PhotoEntity>> allPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/multimedias/photos');

    return parseListJson<PhotoEntity>((
      listJson: _resp,
      fromJson: PhotoEntity.fromMap,
    ));
  }
}
