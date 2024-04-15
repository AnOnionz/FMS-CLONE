import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/images/data/repositories/delete_image_repository_impl.dart';

class DeleteLocalImageUseCase extends UseCase<void, String> {
  final DeleteImageRepositoryImpl repository;

  DeleteLocalImageUseCase(this.repository);
  @override
  Future<Result<void>> call(String uuid) {
    return repository.deleteLocalImage(uuid: uuid);
  }
}
