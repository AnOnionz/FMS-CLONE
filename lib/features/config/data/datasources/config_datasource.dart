import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/config/domain/entities/config.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../../work_place/domain/entities/work_place_entity.dart';

abstract class IConfigDatasource {
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model);
}

class ConfigDatasource extends RemoteDatasource implements IConfigDatasource {
  @override
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${model.project!.id}/outlets/${model.outlet!.id}/booths/${model.booth!.id}/configs');
    return parseJson<ConfigEntity>(
        (json: _resp, fromJson: ConfigEntity.fromMap));
  }
}
