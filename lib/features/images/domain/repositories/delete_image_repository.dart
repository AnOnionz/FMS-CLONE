import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';

abstract class DeleteImageRepository {
  Future<Result<void>> deleteImage(
      {required GeneralEntity general,
      required FeatureEntity feature,
      required int id,
      required String uuid});
  Future<Result<void>> deleteLocalImage({required String uuid});
}
