import '../../../../core/data_source/remote_datasource.dart';
import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/general_entity.dart';
import '../../domain/entities/crawl_quantity_entity.dart';

abstract class ICrawlRemoteDatasource {
  Future<CrwalQuantityEntity?> crwalQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general,
      required FeatureEntity feature});
  Future<List<CrwalQuantityEntity>> getQuantities(
      {required GeneralEntity general, required FeatureEntity feature});
}

class CrawlRemoteDatasource extends RemoteDatasource
    implements ICrawlRemoteDatasource {
  @override
  Future<CrwalQuantityEntity?> crwalQuantities(
      {required CrwalQuantityEntity quantities,
      required GeneralEntity general,
      required FeatureEntity feature}) async {
    final formData = quantities.toMap();

    final _resp = await dio.post(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/quantities',
        data: formData);
    return parseJson<CrwalQuantityEntity>(
        (json: _resp, fromJson: CrwalQuantityEntity.fromMap));
  }

  @override
  Future<List<CrwalQuantityEntity>> getQuantities(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${general.attendance!.id}/features/${feature.id}/quantities');

    return parseListJson<CrwalQuantityEntity>((
      listJson: _resp,
      fromJson: CrwalQuantityEntity.fromMap,
    ));
  }
}
