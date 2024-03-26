import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class ChangePassUsecase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  ChangePassUsecase({required this.repository});
  @override
  Future<Result<bool>> call(NoParams params) async {
    return repository.changePasswordWithAuth0();
  }
}
