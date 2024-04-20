import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';

abstract class DeleteImageRepository {
  Future<Result<void>> deletePhoto(
      {required FeatureEntity feature, required int id, required String uuid});
  Future<Result<void>> deleteLocalPhoto(
      {required String uuid, String? noteUuid});
}
