import 'package:fms/core/repository/repository.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/either.dart';
import '../../domain/repositories/lock_repository.dart';
import '../datasources/lock_local_datasource.dart';

class DataLockRepository extends LockRepository {
  final _lockLocalDatasource = LockLocalDatasource();

  @override
  Future<Result<void>> deletePasscode() {
    return todo(() async {
      await _lockLocalDatasource.deletePasscode();
      return Right(null);
    });
  }

  @override
  Future<Result<bool>> hasPasscode() {
    return todo(() async {
      final hasPasscode = await _lockLocalDatasource.hasPasscode();
      return Right(hasPasscode);
    });
  }

  @override
  Future<Result<void>> savePasscode(String passcode) {
    return todo(() async {
      await _lockLocalDatasource.savePasscode(passcode);
      return Right(null);
    });
  }

  @override
  Future<Result<bool>> validatePasscode(String passcode) {
    return todo(() async {
      final validate = await _lockLocalDatasource.validatePasscode(passcode);
      return Right(validate);
    });
  }
}
