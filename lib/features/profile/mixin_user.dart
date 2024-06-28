import 'package:fms/core/database/database.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

mixin UserMixin {
  EmployeeUserEntity? get user =>
      Database.instance.getObject<EmployeeEntity>()?.user;
}
