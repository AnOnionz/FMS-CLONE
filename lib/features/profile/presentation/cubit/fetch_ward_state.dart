part of 'fetch_ward_cubit.dart';

sealed class FetchWardState extends Equatable {
  const FetchWardState();

  @override
  List<Object> get props => [];
}

final class FetchWardInitial extends FetchWardState {}

final class FetchWardLoading extends FetchWardState {}

final class FetchWardSuccess extends FetchWardState {
  final List<Ward> wards;

  FetchWardSuccess(this.wards);
}

final class FetchWardFailure extends FetchWardState {}
