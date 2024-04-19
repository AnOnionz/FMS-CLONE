import '../../../../core/constant/enum.dart';
import '../../../../core/constant/type_def.dart';

abstract class SyncRepository {
  Future<Result<void>> synchronized(
      {required Map<FeatureType, List<dynamic>> data});
}
