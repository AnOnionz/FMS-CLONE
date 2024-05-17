import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/domain/usecases/create_order_usecase.dart';
import 'package:fms/features/order/domain/usecases/update_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrderUsecase createOrder;
  final UpdateOrderUsecase updateOrder;

  OrderBloc(this.createOrder, this.updateOrder) : super(OrderInitial()) {
    on<CreateOrder>((event, emit) async {
      emit(OrderCreateLoading());
      await createOrder(event.order);
      emit(OrderCreateSuccess());
    }, transformer: droppable());
    on<UpdateOrder>((event, emit) async {
      emit(OrderCreateLoading());
      final execute = await updateOrder(event.order);
      execute.fold((failure) => emit(OrderUpdateFailure(failure)),
          (data) => emit(OrderUpdateSuccess(data)));
    }, transformer: droppable());
  }
}
