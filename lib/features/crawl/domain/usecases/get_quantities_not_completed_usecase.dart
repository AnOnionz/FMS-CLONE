import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/crawl/data/repositories/crawl_repository_impl.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

class GetQuantitiesNotCompletedUsecase
    extends UseCase<FeatureEntity?, FeatureEntity> {
  final CrawlRepositoryImpl repository;

  GetQuantitiesNotCompletedUsecase(this.repository);
  @override
  Future<Result<FeatureEntity?>> call(FeatureEntity params) {
    return repository.getQuantitiesNotCompleted(feature: params);
  }
}
