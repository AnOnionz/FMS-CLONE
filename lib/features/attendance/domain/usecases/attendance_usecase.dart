import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/attendance_repository_impl.dart';

class AttendanceUsecase extends UseCase<AttendanceData?, AttendanceParams> {
  final AttendanceRepositoryImpl repository;

  AttendanceUsecase(this.repository);

  @override
  Future<Result<AttendanceData?>> call(params) {
    return repository.postAttendance(
      file: params.file,
      position: params.position,
      time: params.time,
      feature: params.feature,
    );
  }
}

class AttendanceParams {
  final XFile? file;
  final Position? position;
  final DateTime time;
  final FeatureEntity feature;

  AttendanceParams({
    this.file,
    this.position,
    required this.time,
    required this.feature,
  });
}
