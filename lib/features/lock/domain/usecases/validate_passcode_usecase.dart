import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/data_lock_repository.dart';

class ValidatePasscodeUsecase extends UseCase<bool, String> {
  final DataLockRepository _dataLockRepository;

  ValidatePasscodeUsecase(this._dataLockRepository);

  @override
  Future<Result<bool>> call(String params) {
    return _dataLockRepository.validatePasscode(params);
  }
}
