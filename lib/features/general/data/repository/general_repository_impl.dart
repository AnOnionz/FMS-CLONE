import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/data/datasource/general_local_datasource.dart';
import 'package:fms/features/general/data/datasource/general_remote_datasource.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/repository/general_repository.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

class GeneralRepository extends Repository implements IGeneralRepository {
  GeneralEntity? general;
  final AttendanceRemoteDataSource _attendanceRemote;
  final GeneralRemoteDatasorce _remote;
  final GeneralLocalDataSource _local;

  GeneralRepository(this._remote, this._attendanceRemote, this._local);

  @override
  Future<Result<GeneralEntity?>> getLocalGeneral() async {
    final localGeneral = _local.getGeneral();
    if (localGeneral != null) {
      general = localGeneral;
    }
    return Right(localGeneral);
  }

  @override
  Future<Result<ConfigEntity?>> getRemoteConfig(WorkPlaceEntity model) {
    return todo(() async {
      final config = await _remote.getConfigs(model);
      return Right(config);
    });
  }

  @override
  Future<Result<void>> createGeneral(GeneralEntity entity) async {
    general = entity;
    _local.cacheGeneral(entity);
    return Right(Never);
  }

  @override
  Future<Result<GeneralEntity>> refreshGenaral(
      AttendanceEntity attendance) async {
    return todo(() async {
      general = general!.copyWith(attendance: attendance);
      _local.cacheGeneral(general!);
      return Right(general!);
    });
  }

  @override
  Future<Result<AttendanceEntity?>> getAttedanceInfo() async {
    return todo(() async {
      final attendanceFeature = general!.config.features?.firstWhereOrNull(
          (feature) => feature.type == FeatureType.attendanceClockingIn);
      if (attendanceFeature != null) {
        final attendance = await _attendanceRemote.getAttendanceInfo(
            feature: attendanceFeature, general: general!);

        return Right(attendance);
      }
      return Right(null);
    });
  }

  @override
  Future<Result<void>> clearGeneral() async {
    _local.clearGeneral();
    return Right(Never);
  }
}
