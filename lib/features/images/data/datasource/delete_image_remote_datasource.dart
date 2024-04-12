import 'package:fms/core/data_source/remote_datasource.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

abstract class IDeteleImageRemoteDataSource {
  Future<void> deleteImage(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id});
}

class DeleteImageRemoteDataSource extends RemoteDatasource
    implements IDeteleImageRemoteDataSource {
  @override
  Future<void> deleteImage(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id}) async {
    await dio.delete(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/photos/$id');
  }
}
