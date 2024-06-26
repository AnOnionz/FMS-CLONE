import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../statistic/domain/entities/employee_entity.dart';

abstract class IProfileRemoteDataSource {
  Future<EmployeeEntity?> getUserInfo();
}

class ProfileRemoteDataSource extends RemoteDatasource
    implements IProfileRemoteDataSource {
  @override
  Future<EmployeeEntity?> getUserInfo() async {
    final _resp = await dio.get(path: '/app/userinfo');
    final user = parseJson<EmployeeUserEntity>(
        (json: _resp, fromJson: EmployeeUserEntity.fromMap));
    if (user == null) return null;
    return EmployeeEntity(id: 51198, user: user);
  }
}
