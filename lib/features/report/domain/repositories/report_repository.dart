import 'package:fms/core/constant/type_def.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';
import '../entities/photo_entity.dart';

abstract class ReportRepository {
  Future<Result<List<PhotoEntity>>> createPhotos(
      {required List<PhotoEntity> photos, required FeatureEntity feature});
  Future<Result<List<PhotoEntity>>> allPhotos({required FeatureEntity feature});
  Future<Result<FeatureEntity?>> getPhotosNotCompleted(
      {required FeatureEntity feature});
  Future<Result<bool>> hasNoSyncedData({required GeneralEntity general});
}
