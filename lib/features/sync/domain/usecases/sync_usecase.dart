import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/sync/data/repositories/sync_repository_impl.dart';

class SyncUseCase extends UseCase<void, Map<FeatureEntity, List<DataEntity>>> {
  final SyncRepositoryImpl _syncRepository;

  SyncUseCase(this._syncRepository);
  @override
  Future<Result<void>> call(Map<FeatureEntity, List<DataEntity>> params) {
    return _syncRepository.synchronized(data: params);
  }
}
