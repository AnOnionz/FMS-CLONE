import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/mixins/common.dart';
import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../domain/entities/crawl_quantity_entity.dart';

abstract class ICrawlRemoteDatasource {
  Future<CrawlQuantityEntity?> crwalQuantities(
      {required CrawlQuantityEntity quantities,
      required GeneralEntity general});
  Future<CrawlQuantityEntity?> getQuantities(
      {required FeatureEntity feature, required GeneralEntity general});
}

class CrawlRemoteDatasource extends RemoteDatasource
    implements ICrawlRemoteDatasource {
  @override
  Future<CrawlQuantityEntity?> crwalQuantities(
      {required CrawlQuantityEntity quantities,
      required GeneralEntity general}) async {
    final formData = quantities.toMap();
    Fx.log(formData);

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${quantities.featureId}/quantities',
        data: formData);
    return parseJson<CrawlQuantityEntity>(
        (json: _resp, fromJson: CrawlQuantityEntity.fromMap));
  }

  @override
  Future<CrawlQuantityEntity?> getQuantities(
      {required FeatureEntity feature, required GeneralEntity general}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/quantities');

    return parseJson<CrawlQuantityEntity>((
      json: _resp,
      fromJson: CrawlQuantityEntity.fromMap,
    ));
  }
}
