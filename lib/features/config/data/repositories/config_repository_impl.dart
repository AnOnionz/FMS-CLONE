import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/work_place/domain/entities/config.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/usecase/either.dart';
import '../../domain/repositories/config_repository.dart';
import '../datasources/config_datasource.dart';

class ConfigRepositoryImpl extends Repository implements ConfigRepository {
  final ConfigDatasource _dataSource;

  ConfigRepositoryImpl(this._dataSource);

  ConfigEntity? _config;

  @override
  Future<Result<ConfigEntity?>> getConfigs(WorkPlaceEntity model) {
    return todo(() async {
      final config = await _dataSource.getConfigs(model);
      _config = config;
      return Right(config);
    });
  }

  @override
  ConfigEntity? get config => _config;
}
