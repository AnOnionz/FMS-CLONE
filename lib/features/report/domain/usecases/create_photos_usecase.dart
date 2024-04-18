import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';

import '../entities/photo_entity.dart';

class CreatePhotosUsecase extends UseCase<void, CreatePhotosParams> {
  final ReportRepositoryImpl repository;

  CreatePhotosUsecase(this.repository);
  @override
  Future<Result<void>> call(CreatePhotosParams params) async {
    return repository.createPhotos(
        photos: params.photos, feature: params.feature);
  }
}

class CreatePhotosParams {
  final List<PhotoEntity> photos;

  final FeatureEntity feature;

  CreatePhotosParams({required this.photos, required this.feature});
}
