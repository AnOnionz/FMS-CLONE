import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/order/data/repositories/order_repository_impl.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

class CreateOrderUsecase extends UseCase<void, OrderEntity> {
  final OrderRepositoryImpl repository;

  CreateOrderUsecase(this.repository);
  @override
  Future<Result<void>> call(OrderEntity params) async {
    return repository.createOrder(order: params);
  }
}
