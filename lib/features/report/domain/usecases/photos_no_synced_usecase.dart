import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/report_repository_impl.dart';

class PhotosNoSyncedDataUsecase extends UseCase<List<PhotoEntity>, void> {
  final ReportRepositoryImpl repository;

  PhotosNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<List<PhotoEntity>>> call([void params]) {
    return repository.noSyncedData();
  }
}
