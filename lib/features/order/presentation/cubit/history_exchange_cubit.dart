import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/order/domain/usecases/get_orders_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/order_entity.dart';

part 'history_exchange_state.dart';

class HistoryExchangeCubit extends Cubit<HistoryExchangeState> {
  final GetOrdersUsecase getOrders;
  HistoryExchangeCubit(this.getOrders) : super(HistoryExchangeInitial());

  Future<void> loadAllExchangeHistory({required int featureExchangeId}) async {
    emit(HistoryExchangeLoading());
    final execute = await getOrders(featureExchangeId);
    execute.fold((failure) => emit(HistoryExchangeFailure(failure)),
        (orders) => emit(HistoryExchangeSuccess(orders: orders)));
  }
}
