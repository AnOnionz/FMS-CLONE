part of 'fetch_district_cubit.dart';

sealed class FetchDistrictState extends Equatable {
  const FetchDistrictState();

  @override
  List<Object> get props => [];
}

final class FetchDistrictInitial extends FetchDistrictState {}

final class FetchDistrictLoading extends FetchDistrictState {}

final class FetchDistrictSuccess extends FetchDistrictState {
  final List<District> districts;

  FetchDistrictSuccess(this.districts);
}

final class FetchDistrictFailure extends FetchDistrictState {}
