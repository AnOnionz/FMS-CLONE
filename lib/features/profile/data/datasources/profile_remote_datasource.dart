import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../statistic/domain/entities/employee_entity.dart';
import '../../domain/entities/profile_status_entity.dart';

abstract class IProfileRemoteDataSource {
  Future<EmployeeEntity?> getUserInfo();
  Future<ProfileStatusEntity?> getProfileStatus();
}

class ProfileRemoteDataSource extends RemoteDatasource
    implements IProfileRemoteDataSource {
  @override
  Future<EmployeeEntity?> getUserInfo() async {
    final _resp = await dio.get(path: '/app/user-info');
    final user = parseJson<EmployeeUserEntity>(
        (json: _resp, fromJson: EmployeeUserEntity.fromMap));
    if (user == null) return null;
    return EmployeeEntity(id: 51198, user: user);
  }

  @override
  Future<ProfileStatusEntity?> getProfileStatus() async {
    final _resp = await dio.get(path: '/app/user-profile/processing-status');
    final status = parseJson<ProfileStatusEntity>(
        (json: _resp, fromJson: ProfileStatusEntity.fromMap));
    return status;
  }
}
