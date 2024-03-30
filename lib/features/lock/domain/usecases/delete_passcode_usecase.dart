import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/data_lock_repository.dart';

class DeletePasscodeUsecase extends UseCase<void, void> {
  final DataLockRepository _dataLockRepository;

  DeletePasscodeUsecase(this._dataLockRepository);

  @override
  Future<Result<void>> call([void param]) {
    return _dataLockRepository.deletePasscode();
  }
}
