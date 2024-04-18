import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';

class GetPhotosNotCompletedUsecase
    extends UseCase<FeatureEntity?, FeatureEntity> {
  final ReportRepositoryImpl repository;

  GetPhotosNotCompletedUsecase(this.repository);
  @override
  Future<Result<FeatureEntity?>> call(FeatureEntity params) {
    return repository.getPhotosNotCompleted(feature: params);
  }
}
