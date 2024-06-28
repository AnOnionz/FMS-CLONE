import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../entities/profile_status_entity.dart';

abstract class ProfileRepository {
  Future<Result<EmployeeEntity?>> getUserInfo();
  Future<Result<ProfileStatusEntity?>> getProfileStatus();
}
