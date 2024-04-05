import 'package:dio/dio.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/datasource/images_remote_datasource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

abstract class IAttendanceRemoteDataSource {}

class AttendanceRemoteDataSource extends ImagesRemoteDataSource
    implements IAttendanceRemoteDataSource {
  AttendanceRemoteDataSource(super.dio);

  Future<bool> attendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature config,
      required GeneralEntity general}) async {
    if (file != null) {
      final imageServerModel = await uploadImageToServer(file);
      if (imageServerModel != null) {
        await uploadImageToCloud(file, imageUploadModel: imageServerModel);

        final form = FormData.fromMap({
          if (position != null) 'latitude': position.latitude,
          if (position != null) 'longitude': position.longitude,
          'imageId': imageServerModel.id,
          'deviceId': null,
          'deviceTime': time.toIso8601String()
        });

        await dio.post(
            data: form,
            path:
                '/app/projects/${general.project.id}/outlets/${general.outlet.id}/booths/${general.booth.id}/features/${config.id}/attendance');
      }
    }
    return true;
  }
}
