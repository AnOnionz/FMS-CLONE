import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/domain/usecases/create_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrderUsecase createOrder;

  OrderBloc(this.createOrder) : super(OrderInitial()) {
    on<CreateOrder>((event, emit) async {
      emit(OrderCreateLoading());
      await createOrder(event.order);
      emit(OrderCreateSuccess());
    });
    on<UpdateOrder>(
      (event, emit) async {
        emit(OrderCreateLoading());
        final execute = await createOrder(event.order);
        execute.fold((failure) => OrderUpdateFailure(failure),
            (data) => OrderUpdateSuccess());
      },
    );
  }
}
