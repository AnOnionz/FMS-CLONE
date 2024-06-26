import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class ProfileRepository {
  Future<Result<EmployeeEntity?>> getUserInfo();
}
