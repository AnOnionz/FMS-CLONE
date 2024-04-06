import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/datasource/images_remote_datasource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../images/data/models/image_upload_model.dart';
import '../../domain/entities/attendance_entity.dart';

abstract class IAttendanceRemoteDataSource {
  Future<int> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature feature,
      required GeneralEntity general});
  Future<AttendanceEntity?> getAttendance(
      {required Feature feature, required GeneralEntity general});
}

class AttendanceRemoteDataSource extends ImagesRemoteDataSource
    implements IAttendanceRemoteDataSource {
  AttendanceRemoteDataSource(super.dio);

  Future<int> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature feature,
      required GeneralEntity general}) async {
    ImageUploadModel? imageServerModel;
    if (file != null) {
      imageServerModel = await uploadImageToServer(file);
      if (imageServerModel != null) {
        await uploadImageToCloud(file, imageUploadModel: imageServerModel);
      }
    }
    final form = {
      if (position != null) 'latitude': position.latitude,
      if (position != null) 'longitude': position.longitude,
      if (imageServerModel != null) 'imageId': imageServerModel.id,
      'deviceTime': time.toIso8601String()
    };

    final _resp = await dio.post(
        data: form,
        path:
            '/app/projects/${general.project.id}/outlets/${general.outlet.id}/booths/${general.booth.id}/features/${feature.id}/attendance');

    return (_resp as Map)['id'] as int;
  }

  @override
  Future<AttendanceEntity?> getAttendance(
      {required Feature feature, required GeneralEntity general}) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${general.project.id}/outlets/${general.outlet.id}/booths/${general.booth.id}/features/${feature.id}/attendance');

    return parseJson<AttendanceEntity>(
        (json: _resp, fromJson: AttendanceEntity.fromMap));
  }
}
