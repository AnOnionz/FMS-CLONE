import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../data/repositories/order_repository_impl.dart';

class GetOrdersNotCompletedUsecase
    extends UseCase<FeatureEntity?, FeatureEntity> {
  final OrderRepositoryImpl repository;

  GetOrdersNotCompletedUsecase(this.repository);
  @override
  Future<Result<FeatureEntity?>> call(FeatureEntity params) {
    return repository.getOrdersNotCompleted(feature: params);
  }
}
