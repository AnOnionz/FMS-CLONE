part of 'locate_cubit.dart';

sealed class LocateState extends Equatable {
  const LocateState();

  @override
  List<Object> get props => [];
}

final class LocateInitial extends LocateState {}

final class LocateInProgress extends LocateState {}

final class LocateSuccess extends LocateState {
  final Position position;

  LocateSuccess({required this.position});
}

final class LocateDistanceInvalid extends LocateState {
  LocateDistanceInvalid();
}

final class LocateFailue extends LocateState {
  final Failure error;

  LocateFailue({required this.error});
}
