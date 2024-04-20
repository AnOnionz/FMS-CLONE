import 'package:fms/features/general/domain/entities/data_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/report_repository_impl.dart';

class PhotosNoSyncedDataUsecase extends UseCase<List<DataEnitity>, void> {
  final ReportRepositoryImpl repository;

  PhotosNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<List<DataEnitity>>> call([void params]) {
    return repository.noSyncedData();
  }
}
