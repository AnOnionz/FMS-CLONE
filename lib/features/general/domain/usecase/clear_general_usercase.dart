import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';

class ClearGeneralUseCase extends UseCase<void, void> {
  final GeneralRepository repository;

  ClearGeneralUseCase(this.repository);
  @override
  Future<Result<void>> call([void params]) {
    return repository.clearGeneral();
  }
}
