import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/data_lock_repository.dart';

class HasPasscodeUsecase extends UseCase<bool, void> {
  final DataLockRepository _dataLockRepository;

  HasPasscodeUsecase(this._dataLockRepository);

  @override
  Future<Result<bool>> call([void params]) {
    return _dataLockRepository.hasPasscode();
  }
}
