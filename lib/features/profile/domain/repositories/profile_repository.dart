import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/type_def.dart';
import '../entities/profile_status_entity.dart';
import '../entities/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<Result<EmployeeEntity?>> getUserInfo();
  Future<Result<void>> createUserProfile(
      {required UserProfileEntity userProfile});
  Future<Result<void>> uploadFaceVerifyImage(XFile file);
  Future<Result<ProfileStatusEntity?>> getProfileStatus();
  Future<Result<UserProfileEntity?>> getUserProfile();
  Future<Result<List<Province>>> getProvinces();
  Future<Result<List<District>>> getDistricts({required int provinceId});
  Future<Result<List<Ward>>> getWards(
      {required int provinceId, required int districtId});
}
