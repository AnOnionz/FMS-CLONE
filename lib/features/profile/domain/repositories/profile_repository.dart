import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../entities/profile_status_entity.dart';

abstract class ProfileRepository {
  Future<Result<EmployeeEntity?>> getUserInfo();
  Future<Result<ProfileStatusEntity?>> getProfileStatus();
  Future<Result<List<Province>>> getProvinces();
  Future<Result<List<District>>> getDistricts({required int provinceId});
  Future<Result<List<Ward>>> getWards(
      {required int provinceId, required int districtId});
}
