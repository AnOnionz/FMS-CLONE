import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/images/data/repositories/delete_image_repository_impl.dart';

class DeletePhotoUseCase extends UseCase<void, DeletePhotoParams> {
  final DeletePhotoRepositoryImpl repository;

  DeletePhotoUseCase(this.repository);
  @override
  Future<Result<void>> call(DeletePhotoParams params) {
    return repository.deletePhoto(
        feature: params.feature, id: params.id, uuid: params.uuid);
  }
}

class DeletePhotoParams {
  final FeatureEntity feature;
  final int id;
  final String uuid;
  String? noteUuid;

  DeletePhotoParams(
      {required this.feature,
      required this.id,
      required this.uuid,
      this.noteUuid});
}
