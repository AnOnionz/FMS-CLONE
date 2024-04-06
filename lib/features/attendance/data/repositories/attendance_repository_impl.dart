import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';

import 'package:fms/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';
import '../../domain/entities/attendance_entity.dart';

class AttendanceRepositoryImpl extends Repository
    implements AttendanceRepository {
  final AttendanceRemoteDataSource _remote;

  AttendanceRepositoryImpl({required AttendanceRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Result<int>> postAttendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature feature,
      required GeneralEntity general}) {
    return todo(() async {
      final id = await _remote.postAttendance(
          file: file,
          time: time,
          position: position,
          feature: feature,
          general: general);
      return Right(id);
    }, useInternet: true);
  }

  @override
  Future<Result<AttendanceEntity?>> getAttendance(
      {required Feature feature, required GeneralEntity general}) {
    return todo(() async {
      final attendanceEntity =
          await _remote.getAttendance(feature: feature, general: general);

      return Right(attendanceEntity);
    }, useInternet: true);
  }
}
