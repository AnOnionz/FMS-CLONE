import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/data_lock_repository.dart';

class SavePasscodeUsecase extends UseCase<void, String> {
  final DataLockRepository _dataLockRepository;

  SavePasscodeUsecase(this._dataLockRepository);

  @override
  Future<Result<void>> call(String params) {
    return _dataLockRepository.savePasscode(params);
  }
}
