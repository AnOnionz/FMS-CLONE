import 'package:fms/core/data_source/remote_datasource.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

abstract class IDeteleImageRemoteDataSource {
  Future<void> deletePhoto(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id});
  Future<void> deleteNotePhoto(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id});
  Future<void> deleteOrderPhoto(
      {required int attendanceId,
      required int featureId,
      required int orderId,
      required int id});
}

class DeletePhotoRemoteDataSource extends RemoteDatasource
    implements IDeteleImageRemoteDataSource {
  @override
  Future<void> deletePhoto(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id}) async {
    await dio.delete(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/photos/$id');
  }

  Future<void> deleteNotePhoto(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id}) async {
    await dio.delete(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/multimedias/photos/$id');
  }

  @override
  Future<void> deleteOrderPhoto(
      {required int attendanceId,
      required int featureId,
      required int id,
      required int orderId}) async {
    await dio.delete(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/orders/$orderId/photos/$id');
  }
}
