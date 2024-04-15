import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';

class GetPhotosUsecase extends UseCase<List<PhotoEntity>, GetPhotosParams> {
  final ReportRepositoryImpl repository;

  GetPhotosUsecase(this.repository);
  @override
  Future<Result<List<PhotoEntity>>> call(GetPhotosParams params) {
    return repository.allPhotos(
        general: params.general, feature: params.feature);
  }
}

class GetPhotosParams {
  final GeneralEntity general;
  final FeatureEntity feature;

  GetPhotosParams({required this.general, required this.feature});
}
