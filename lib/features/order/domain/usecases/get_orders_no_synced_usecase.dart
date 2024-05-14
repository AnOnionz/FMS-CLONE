import 'package:fms/features/general/domain/entities/data_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/order_repository_impl.dart';

class GetOrdersNoSyncedDataUsecase
    extends UseCase<Map<int, List<DataEntity>>, void> {
  final OrderRepositoryImpl repository;

  GetOrdersNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<Map<int, List<DataEntity>>>> call([void params]) {
    return repository.noSyncedData();
  }
}
