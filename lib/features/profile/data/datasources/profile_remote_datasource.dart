import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../statistic/domain/entities/employee_entity.dart';
import '../../domain/entities/profile_status_entity.dart';

abstract class IProfileRemoteDataSource {
  Future<EmployeeEntity?> getUserInfo();
  Future<ProfileStatusEntity?> getProfileStatus();
  Future<List<Province>> getProvinces();
  Future<List<District>> getDistricts({required int provinceId});
  Future<List<Ward>> getWards(
      {required int provinceId, required int districtId});
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

  @override
  Future<List<District>> getDistricts({required int provinceId}) async {
    final _resp =
        await dio.get(path: '/locations/provinces/$provinceId/districts');

    return parseListJson((listJson: _resp, fromJson: District.fromMap));
  }

  @override
  Future<List<Province>> getProvinces() async {
    final _resp = await dio.get(path: '/locations/provinces');

    return parseListJson((listJson: _resp, fromJson: Province.fromMap));
  }

  @override
  Future<List<Ward>> getWards(
      {required int provinceId, required int districtId}) async {
    final _resp = await dio.get(
        path: '/locations/provinces/$provinceId/districts/$districtId/wards');

    return parseListJson((listJson: _resp, fromJson: Ward.fromMap));
  }
}
