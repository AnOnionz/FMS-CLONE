import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../attendance/domain/entities/attendance_entity.dart';
import '../../../work_place/domain/entities/work_place_entity.dart';

abstract class IGeneralRepository {
  Future<Result<ConfigEntity?>> getRemoteConfig(WorkPlaceEntity model);
  Future<Result<GeneralEntity?>> getLocalGeneral();
  Future<Result<AttendanceEntity?>> getAttedanceInfo();
  Future<Result<void>> createGeneral(GeneralEntity entity);
  Future<Result<void>> refreshGenaral(AttendanceEntity attendance);
  Future<Result<void>> clearGeneral();
}
