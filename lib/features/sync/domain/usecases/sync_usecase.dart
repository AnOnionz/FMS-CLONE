import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/sync/data/repositories/sync_repository_impl.dart';

class SyncUseCase extends UseCase<void, Map<FeatureType, List<dynamic>>> {
  final SyncRepositoryImpl _syncRepository;

  SyncUseCase(this._syncRepository);
  @override
  Future<Result<void>> call(Map<FeatureType, List<dynamic>> params) async {
    return await _syncRepository.synchronized(data: params);
  }
}
