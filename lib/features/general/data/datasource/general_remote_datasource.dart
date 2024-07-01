import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../work_place/domain/entities/work_place_entity.dart';
import '../../domain/entities/config_entity.dart';

abstract class IGeneralRemoteDatasource {
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model);
}

class GeneralRemoteDatasorce extends RemoteDatasource
    implements IGeneralRemoteDatasource {
  @override
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${model.project!.id}/outlets/${model.outlet!.id}/booths/${model.booth!.id}/configs');

    return parseJson<ConfigEntity>(
        (json: _resp, fromJson: ConfigEntity.fromMap));
  }
}
