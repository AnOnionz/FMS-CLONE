import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import '../../../../core/database/database.dart';

abstract class IProfileLocalDataSource {
  void cacheUser(EmployeeEntity user);
  void clearUser();
  EmployeeEntity? getUser();
}

class ProfileLocalDataSource implements IProfileLocalDataSource {
  final database = Database.instance;
  @override
  void cacheUser(EmployeeEntity user) {
    database.addObject<EmployeeEntity>(user);
  }

  @override
  void clearUser() {
    database.clearCollection<EmployeeEntity>();
  }

  @override
  EmployeeEntity? getUser() {
    final user = database.getObject<EmployeeEntity>();

    return user;
  }
}
