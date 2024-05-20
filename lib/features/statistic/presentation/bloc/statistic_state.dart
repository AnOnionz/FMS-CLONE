part of 'statistic_bloc.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoading extends StatisticState {}

class StatisticSuccess extends StatisticState {
  final StatisticEntity statistic;

  StatisticSuccess(this.statistic);
}

class StatisticFailure extends StatisticState {
  final Failure failure;

  StatisticFailure(this.failure);
}
