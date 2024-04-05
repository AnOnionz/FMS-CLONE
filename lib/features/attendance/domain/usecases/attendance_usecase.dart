import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/attendance_repository_impl.dart';

class AttendanceUsecase extends UseCase<bool, AttendanceParams> {
  final AttendanceRepositoryImpl repository;

  AttendanceUsecase(this.repository);

  @override
  Future<Result<bool>> call(params) {
    return repository.attendance(
        file: params.file,
        position: params.position,
        time: params.time,
        config: params.config,
        general: params.general);
  }
}

class AttendanceParams {
  final XFile? file;
  final Position? position;
  final DateTime time;
  final Feature config;
  final GeneralEntity general;

  AttendanceParams(
      {required this.file,
      required this.position,
      required this.time,
      required this.config,
      required this.general});
}
