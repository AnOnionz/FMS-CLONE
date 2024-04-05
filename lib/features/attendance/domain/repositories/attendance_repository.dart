import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/type_def.dart';
import '../../../config/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';

abstract class AttendanceRepository {
  Future<Result<bool>> attendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature config,
      required GeneralEntity general});
}
