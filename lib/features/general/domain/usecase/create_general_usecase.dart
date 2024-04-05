import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

class CreateGeneralUseCase extends UseCase<void, GeneralEntity> {
  final GeneralRepository repository;

  CreateGeneralUseCase(this.repository);
  @override
  Future<Result<void>> call(GeneralEntity params) {
    return repository.createGeneral(params);
  }
}
