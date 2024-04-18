import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

class GetPhotosUsecase extends UseCase<List<PhotoEntity>, FeatureEntity> {
  final ReportRepositoryImpl repository;

  GetPhotosUsecase(this.repository);
  @override
  Future<Result<List<PhotoEntity>>> call(FeatureEntity params) {
    return repository.allPhotos(feature: params);
  }
}
