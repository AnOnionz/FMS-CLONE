import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

class GetGeneralUseCase extends UseCase<GeneralEntity?, void> {
  final GeneralRepository repository;

  GetGeneralUseCase(this.repository);
  @override
  Future<Result<GeneralEntity?>> call([void params]) {
    return repository.getLocalGeneral();
  }
}
