import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class ChangePassUsecase extends UseCase<void, void> {
  final UserRepository repository;

  ChangePassUsecase({required this.repository});
  @override
  Future<Result<void>> call([void params]) async {
    return repository.changePassword();
  }
}
