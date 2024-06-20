import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';

import 'package:fms/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../general/domain/entities/config_entity.dart';
import '../../domain/entities/attendance_entity.dart';

class AttendanceRepositoryImpl extends Repository
    with GeneralDataMixin
    implements AttendanceRepository {
  final AttendanceRemoteDataSource _remote;

  AttendanceRepositoryImpl({required AttendanceRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Result<AttendanceData?>> postAttendance({
    XFile? file,
    Position? position,
    required DateTime time,
    required FeatureEntity feature,
  }) {
    return todo(() async {
      final attendanceData = await _remote.postAttendance(
          file: file,
          time: time,
          position: position,
          feature: feature,
          general: general);
      return Right(attendanceData);
    });
  }

  @override
  Future<Result<AttendanceEntity?>> getAttendanceInfo(
      {required FeatureEntity feature}) {
    return todo(() async {
      final attendanceEntity =
          await _remote.getAttendanceInfo(feature: feature, general: general);

      return Right(attendanceEntity);
    });
  }

  @override
  Future<Result<List<AttendanceEntity>>> getAttendanceReports(
      {required FeatureEntity feature}) async {
    return todo(() async {
      final attendanceEntities = await _remote.getAttendanceReports(
          feature: feature, general: general);

      return Right(attendanceEntities);
    }, useInternet: true);
  }
}
