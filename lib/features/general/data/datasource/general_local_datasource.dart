import 'package:fms/core/mixins/common.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/database/database.dart';

abstract class IGeneralLocalDataSource {
  void cacheGeneral(GeneralEntity general);
  void clearGeneral();
  GeneralEntity? getGeneral();
}

class GeneralLocalDataSource implements IGeneralLocalDataSource {
  final database = Database.instance;
  @override
  void cacheGeneral(GeneralEntity general) {
    database.addObject<GeneralEntity>(general);
  }

  @override
  void clearGeneral() {
    database.deleteCollection<GeneralEntity>();
  }

  @override
  GeneralEntity? getGeneral() {
    final general = database.getObject<GeneralEntity>();
    Fx.log(general);
    return general;
  }
}
