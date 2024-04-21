import 'package:fms/features/general/domain/entities/data_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/report_repository_impl.dart';

class PhotosNoSyncedDataUsecase
    extends UseCase<Map<int, List<DataEntity>>, void> {
  final ReportRepositoryImpl repository;

  PhotosNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<Map<int, List<DataEntity>>>> call([void params]) {
    return repository.noSyncedData();
  }
}
