import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:fms/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';

class AttendanceRepositoryImpl extends Repository
    implements AttendanceRepository {
  final AttendanceRemoteDataSource _remote;

  AttendanceRepositoryImpl({required AttendanceRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Result<bool>> attendance(
      {XFile? file,
      Position? position,
      required DateTime time,
      required Feature config,
      required GeneralEntity general}) {
    return todo(() async {
      await _remote.attendance(
          file: file,
          time: time,
          position: position,
          config: config,
          general: general);
      return Right(true);
    }, useInternet: true);
  }
}
