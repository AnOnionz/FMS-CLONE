import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/report_repository_impl.dart';

class HasPhotosNoSyncedDataUsecase extends UseCase<bool, GeneralEntity> {
  final ReportRepositoryImpl repository;

  HasPhotosNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<bool>> call(GeneralEntity params) {
    return repository.hasNoSyncedData(general: params);
  }
}
