import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../data/repositories/order_repository_impl.dart';

class GetOrdersUsecase extends UseCase<List<OrderEntity>, int> {
  final OrderRepositoryImpl repository;

  GetOrdersUsecase(this.repository);
  @override
  Future<Result<List<OrderEntity>>> call(int params) {
    return repository.allOrders(featureId: params);
  }
}
