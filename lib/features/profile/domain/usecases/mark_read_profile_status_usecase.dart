import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/profile_repository_impl.dart';

class MarkReadProfileStatusUsecase extends UseCase<void, void> {
  final ProfileRepositoryImpl _repository;

  MarkReadProfileStatusUsecase(this._repository);
  @override
  Future<Result<void>> call([void params]) async {
    return _repository.markReadProfileStatus();
  }
}
