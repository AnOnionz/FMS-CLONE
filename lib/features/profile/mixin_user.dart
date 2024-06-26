import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

mixin UserMixin {
  EmployeeUserEntity? get user =>
      Modular.get<ProfileRepositoryImpl>().user?.user;
}
