import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../domain/entities/work_place_entity.dart';

abstract class IWorkPlaceDatasource {
  Future<List<ProjectEntity>> getProjects();
  Future<List<OutletEntity>> getOutletsOfProject(WorkPlaceEntity model);
  Future<List<BoothEntity>> getBoothsOfOutlet(WorkPlaceEntity model);
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model);
}

class WorkPlaceDatasource extends RemoteDatasource
    implements IWorkPlaceDatasource {
  @override
  Future<List<ProjectEntity>> getProjects() async {
    final _resp = await dio.get(path: '/app/projects');
    return parseListJson<ProjectEntity>(
        (listJson: _resp, fromJson: ProjectEntity.fromMap));
  }

  @override
  Future<List<OutletEntity>> getOutletsOfProject(WorkPlaceEntity model) async {
    final _resp =
        await dio.get(path: '/app/projects/${model.project!.id}/outlets');
    return parseListJson<OutletEntity>(
        (listJson: _resp, fromJson: OutletEntity.fromMap));
  }

  @override
  Future<List<BoothEntity>> getBoothsOfOutlet(WorkPlaceEntity model) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${model.project!.id}/outlets/${model.outlet!.id}/booths');
    return parseListJson<BoothEntity>(
        (listJson: _resp, fromJson: BoothEntity.fromMap));
  }

  @override
  Future<ConfigEntity?> getConfigs(WorkPlaceEntity model) async {
    final _resp = await dio.get(
        path:
            '/app/projects/${model.project!.id}/outlets/${model.outlet!.id}/booths/${model.booth!.id}/configs');
    return parseJson<ConfigEntity>(
        (json: _resp, fromJson: ConfigEntity.fromMap));
  }
}
