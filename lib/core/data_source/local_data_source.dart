import 'package:fms/core/database/database.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

abstract class LocalDatasource {
  late final Database db;
  late final GeneralEntity? general;

  LocalDatasource() {
    db = Database.instance;
  }
}
