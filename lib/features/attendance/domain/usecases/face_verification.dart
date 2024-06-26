import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/attendance_repository_impl.dart';

class FaceVerificationUsecase extends UseCase<void, XFile> {
  final AttendanceRepositoryImpl repository;

  FaceVerificationUsecase(this.repository);

  @override
  Future<Result<void>> call(params) {
    return repository.faceVerification(file: params);
  }
}
