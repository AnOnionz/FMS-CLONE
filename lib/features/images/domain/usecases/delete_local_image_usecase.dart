import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/images/data/repositories/delete_image_repository_impl.dart';

class DeleteLocalPhotoUseCase extends UseCase<void, DeleteLocalPhotoParams> {
  final DeletePhotoRepositoryImpl repository;

  DeleteLocalPhotoUseCase(this.repository);
  @override
  Future<Result<void>> call(DeleteLocalPhotoParams params) {
    return repository.deleteLocalPhoto(
        uuid: params.uuid, noteUuid: params.noteUuid);
  }
}

class DeleteLocalPhotoParams {
  final String uuid;
  String? noteUuid;

  DeleteLocalPhotoParams({required this.uuid, this.noteUuid});
}
