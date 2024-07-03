import 'package:fms/core/usecase/usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/type_def.dart';
import '../../data/repositories/profile_repository_impl.dart';

class UploadFaceVerifyImageUsecase extends UseCase<void, XFile> {
  final ProfileRepositoryImpl _repository;

  UploadFaceVerifyImageUsecase(this._repository);
  @override
  Future<Result<void>> call(XFile params) async {
    return _repository.uploadFaceVerifyImage(params);
  }
}
