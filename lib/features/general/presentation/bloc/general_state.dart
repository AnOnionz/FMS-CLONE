part of 'general_bloc.dart';

sealed class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

final class GeneralInitial extends GeneralState {}

final class GeneralLoading extends GeneralState {}

final class GeneralSuccess extends GeneralState {
  final GeneralEntity general;

  GeneralSuccess({required this.general});
}

final class GeneralFailure extends GeneralState {
  final Failure? failure;

  GeneralFailure({this.failure});
}
