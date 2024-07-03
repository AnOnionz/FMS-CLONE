import 'package:dio/dio.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/datasource/images_remote_datasource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../../../images/data/models/image_upload_model.dart';
import '../../domain/entities/attendance_entity.dart';

abstract class IAttendanceRemoteDataSource {
  Future<void> faceVerification({required XFile file});
  Future<AttendanceData?> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required FeatureEntity feature,
      required GeneralEntity general});
  Future<AttendanceEntity?> getAttendanceInfo(
      {required FeatureEntity feature, required GeneralEntity general});
  Future<List<AttendanceEntity>> getAttendanceReports(
      {required FeatureEntity feature, required GeneralEntity general});
}

class AttendanceRemoteDataSource extends ImagesRemoteDataSource
    implements IAttendanceRemoteDataSource {
  @override
  Future<void> faceVerification({required XFile file}) async {
    final FormData _formData = FormData.fromMap({
      'face': MultipartFile.fromBytes(await file.readAsBytes(),
          contentType: Headers.jsonMimeType
              .change(type: 'image', subtype: file.name.split('.').last),
          filename: file.name)
    });

    await dio.post(data: _formData, path: '/app/face-verification');
  }

  Future<AttendanceData?> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required FeatureEntity feature,
      required GeneralEntity general}) async {
    ImageUploadModel? imageServerModel;
    if (file != null) {
      imageServerModel = await uploadImageToServer(file, withS3: true);
    }
    final form = {
      if (position != null) 'latitude': position.latitude,
      if (position != null) 'longitude': position.longitude,
      if (imageServerModel != null) 'imageId': imageServerModel.id,
      'deviceTime': time.toUtc().toIso8601String()
    };

    final _resp = await dio.post(
        data: form,
        path:
            '/app/projects/${general.project.id}/outlets/${general.outlet.id}/booths/${general.booth.id}/features/${feature.id}/attendance');

    return parseJson<AttendanceData>((
      json: (_resp as Map<String, dynamic>).entries.elementAt(1).value,
      fromJson: AttendanceData.fromMap
    ));
  }

  @override
  Future<AttendanceEntity?> getAttendanceInfo(
      {required FeatureEntity feature, required GeneralEntity general}) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${general.project.id}/outlets/${general.outlet.id}/booths/${general.booth.id}/features/${feature.id}/attendance');

    return parseJson<AttendanceEntity>(
        (json: _resp, fromJson: AttendanceEntity.fromMap));
  }

  @override
  Future<List<AttendanceEntity>> getAttendanceReports(
      {required FeatureEntity feature, required GeneralEntity general}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/team-reports/attendances');

    return parseListJson<AttendanceEntity>(
        (listJson: _resp, fromJson: AttendanceEntity.fromMap));
  }
}
