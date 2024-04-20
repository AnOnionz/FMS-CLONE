import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../domain/entities/crawl_quantity_entity.dart';

abstract class ICrawlRemoteDatasource {
  Future<CrwalQuantityEntity?> crwalQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general});
  Future<CrwalQuantityEntity?> getQuantities(
      {required FeatureEntity feature, required GeneralEntity general});
}

class CrawlRemoteDatasource extends RemoteDatasource
    implements ICrawlRemoteDatasource {
  @override
  Future<CrwalQuantityEntity?> crwalQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general}) async {
    final formData = quantities.toMap();

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${quantities.featureId}/quantities',
        data: formData);
    return parseJson<CrwalQuantityEntity>(
        (json: _resp, fromJson: CrwalQuantityEntity.fromMap));
  }

  @override
  Future<CrwalQuantityEntity?> getQuantities(
      {required FeatureEntity feature, required GeneralEntity general}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/quantities');

    return parseJson<CrwalQuantityEntity>((
      json: _resp,
      fromJson: CrwalQuantityEntity.fromMap,
    ));
  }
}
