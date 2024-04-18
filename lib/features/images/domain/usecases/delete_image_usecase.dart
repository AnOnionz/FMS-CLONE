import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/data/repositories/delete_image_repository_impl.dart';

class DeleteImageUseCase extends UseCase<void, DeleteImageParams> {
  final DeleteImageRepositoryImpl repository;

  DeleteImageUseCase(this.repository);
  @override
  Future<Result<void>> call(DeleteImageParams params) {
    return repository.deleteImage(
        feature: params.feature, id: params.id, uuid: params.uuid);
  }
}

class DeleteImageParams {
  final FeatureEntity feature;
  final int id;
  final String uuid;

  DeleteImageParams(
      {required this.feature, required this.id, required this.uuid});
}
