import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/sync/data/repositories/sync_repository_impl.dart';

class SyncUseCase extends UseCase<void, Map<FeatureEntity, List<DataEnitity>>> {
  final SyncRepositoryImpl _syncRepository;

  SyncUseCase(this._syncRepository);
  @override
  Future<Result<void>> call(
      Map<FeatureEntity, List<DataEnitity>> params) async {
    return await _syncRepository.synchronized(data: params);
  }
}
