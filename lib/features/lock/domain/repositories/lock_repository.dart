import '../../../../core/constant/type_def.dart';

abstract class LockRepository {
  Future<Result<bool>> hasPasscode();
  Future<Result<void>> savePasscode(String passcode);
  Future<Result<void>> deletePasscode();
  Future<Result<bool>> validatePasscode(String passcode);
}
