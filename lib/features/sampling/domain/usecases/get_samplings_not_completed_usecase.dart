import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/sampling/data/repositories/sampling_repository_impl.dart';

class GetSamplingsNotCompletedUsecase
    extends UseCase<FeatureEntity?, FeatureEntity> {
  final SamplingRepositoryImpl repository;

  GetSamplingsNotCompletedUsecase(this.repository);
  @override
  Future<Result<FeatureEntity?>> call(FeatureEntity params) {
    return repository.getSamplingNotCompleted(feature: params);
  }
}
