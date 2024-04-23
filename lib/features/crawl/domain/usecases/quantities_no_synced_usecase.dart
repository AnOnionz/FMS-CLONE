import 'package:fms/features/crawl/data/repositories/crawl_repository_impl.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';

class GetQuantitiesNoSyncedDataUsecase
    extends UseCase<Map<int, List<DataEntity>>, void> {
  final CrawlRepositoryImpl repository;

  GetQuantitiesNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<Map<int, List<DataEntity>>>> call([void params]) {
    return repository.noSyncedData();
  }
}
