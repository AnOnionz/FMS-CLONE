import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/sampling/data/repositories/sampling_repository_impl.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';

class GetSamplingsNoSyncedDataUsecase
    extends UseCase<Map<int, List<BaseEntity>>, void> {
  final SamplingRepositoryImpl repository;

  GetSamplingsNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<Map<int, List<BaseEntity>>>> call([void params]) {
    return repository.noSyncedData();
  }
}
