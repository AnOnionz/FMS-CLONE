part of 'history_exchange_cubit.dart';

sealed class HistoryExchangeState extends Equatable {
  const HistoryExchangeState();

  @override
  List<Object> get props => [];
}

final class HistoryExchangeInitial extends HistoryExchangeState {}

final class HistoryExchangeLoading extends HistoryExchangeState {}

final class HistoryExchangeSuccess extends HistoryExchangeState {
  final List<OrderEntity> orders;

  HistoryExchangeSuccess({required this.orders});
}

final class HistoryExchangeFailure extends HistoryExchangeState {
  final Failure failure;

  HistoryExchangeFailure(this.failure);
}
