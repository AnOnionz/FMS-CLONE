import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/constant/type_def.dart';

abstract class IGeneralRepository {
  Future<Result<void>> createGeneral(GeneralEntity entity);
}
