import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../entities/attendance_entity.dart';

abstract class AttendanceRepository {
  Future<Result<AttendanceData?>> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required FeatureEntity feature});

  Future<Result<AttendanceEntity?>> getAttendanceInfo(
      {required FeatureEntity feature});

  Future<Result<List<AttendanceEntity>>> getAttendanceReports(
      {required FeatureEntity feature});
}
