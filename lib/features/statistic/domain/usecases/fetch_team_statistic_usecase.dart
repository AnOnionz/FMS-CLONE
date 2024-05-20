import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';

import '../../data/repositories/statistic_repository_impl.dart';

class FetchTeamStatisticUseCase extends UseCase<StatisticEntity, int> {
  final StatisticRepositoryImpl _repository;

  FetchTeamStatisticUseCase(this._repository);
  @override
  Future<Result<StatisticEntity>> call(int params) {
    return _repository.fetchTeamStatistic(featureId: params);
  }
}
