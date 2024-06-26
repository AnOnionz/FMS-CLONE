import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:fms/features/profile/domain/repositories/profile_repository.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import '../../../../core/usecase/either.dart';
import '../datasources/profile_local_datasource.dart';

class ProfileRepositoryImpl extends Repository implements ProfileRepository {
  final ProfileRemoteDataSource _remote;
  final ProfileLocalDataSource _local;

  ProfileRepositoryImpl(this._remote, this._local);
  EmployeeEntity? user;

  @override
  Future<Result<EmployeeEntity?>> getUserInfo() async {
    return todo(() async {
      final userInfo = await _remote.getUserInfo();
      if (userInfo != null) {
        _local.clearUser();
        _local.cacheUser(userInfo);
      }
      user = userInfo;
      return Right(userInfo);
    });
  }
}
