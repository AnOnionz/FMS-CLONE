import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/general/data/datasource/general_local_datasource.dart';
import 'package:fms/features/general/data/datasource/general_remote_datasource.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/repository/general_repository.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

class GeneralRepository extends Repository
    with LocalDatasource
    implements IGeneralRepository {
  GeneralEntity? general;
  final AttendanceRemoteDataSource _attendanceRemote;
  final GeneralRemoteDatasorce _remote;
  final GeneralLocalDataSource _local;
  final AuthenticationLocalDataSource _localAuth;

  GeneralRepository(
      this._remote, this._attendanceRemote, this._local, this._localAuth);

  @override
  Future<Result<GeneralEntity?>> getLocalGeneral() async {
    final localGeneral = _local.getGeneral();
    if (localGeneral == null) {
      return Right(null);
    }
    final time = await Modular.get<NetworkTimeService>().ntpDateTime();
    final dateNow = time.dMy();
    if (dateNow.isAfter(localGeneral.createdDate)) {
      db.clearCollection<PhotoEntity>();
      db.clearCollection<NoteEntity>();
      db.clearCollection<CrawlQuantityEntity>();
      return Right(null);
    }
    general = localGeneral;
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
    final identifer = _localAuth.getIdentifier();
    general = entity.copyWith(identifer: identifer);
    _local.cacheGeneral(general!);
    return Right(Never);
  }

  @override
  Future<Result<GeneralEntity>> refreshGenaral(
      {AttendanceEntity? attendance}) async {
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
