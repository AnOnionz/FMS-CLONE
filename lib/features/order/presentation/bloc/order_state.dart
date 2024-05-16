part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderCreateLoading extends OrderState {}

class OrderCreateSuccess extends OrderState {}

class OrderUpdateSuccess extends OrderState {
  final OrderEntity order;

  OrderUpdateSuccess(this.order);
}

class OrderUpdateFailure extends OrderState {
  final Failure failure;

  OrderUpdateFailure(this.failure);
}
