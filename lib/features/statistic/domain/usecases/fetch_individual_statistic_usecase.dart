import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';

import '../../data/repositories/statistic_repository_impl.dart';

class FetchIndividualStatisticUseCase extends UseCase<StatisticEntity, int> {
  final StatisticRepositoryImpl _repository;

  FetchIndividualStatisticUseCase(this._repository);
  @override
  Future<Result<StatisticEntity>> call(int params) {
    return _repository.fetchIndividualStatistic(featureId: params);
  }
}
