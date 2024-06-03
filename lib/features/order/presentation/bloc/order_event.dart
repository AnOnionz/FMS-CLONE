part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends OrderEvent {
  final OrderEntity order;

  CreateOrder({required this.order});
}

class UpdateOrder extends OrderEvent {
  final OrderEntity order;
  final FeatureEntity feature;

  UpdateOrder({required this.order, required this.feature});
}
