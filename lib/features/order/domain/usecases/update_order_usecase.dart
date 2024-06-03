import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/data/repositories/order_repository_impl.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

class UpdateOrderUsecase extends UseCase<OrderEntity, UpdateOrderParams> {
  final OrderRepositoryImpl repository;

  UpdateOrderUsecase(this.repository);
  @override
  Future<Result<OrderEntity>> call(UpdateOrderParams params) async {
    return repository.updateOrder(order: params.order, feature: params.feature);
  }
}

class UpdateOrderParams {
  final OrderEntity order;
  final FeatureEntity feature;

  UpdateOrderParams({required this.order, required this.feature});
}
