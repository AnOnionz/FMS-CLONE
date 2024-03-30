part of 'fetch_work_place_bloc.dart';

sealed class FetchWorkPlaceState extends Equatable {
  const FetchWorkPlaceState();

  @override
  List<Object> get props => [];
}

final class FetchWorkPlaceInitial extends FetchWorkPlaceState {}

final class FetchWorkPlaceLoading extends FetchWorkPlaceState {}

final class FetchWorkPlaceSuccess<T> extends FetchWorkPlaceState {
  final List<T> data;
  FetchWorkPlaceSuccess(this.data);
}

final class FetchWorkPlaceFailure extends FetchWorkPlaceState {
  final Failure failure;

  FetchWorkPlaceFailure(this.failure);
}
