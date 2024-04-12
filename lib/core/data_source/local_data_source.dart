import 'package:fms/core/database/database.dart';

abstract class LocalDatasource {
  late final Database db;

  LocalDatasource() {
    db = Database.instance;
  }
}
