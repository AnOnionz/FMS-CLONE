part of 'fetch_province_cubit.dart';

sealed class FetchProvinceState extends Equatable {
  const FetchProvinceState();

  @override
  List<Object> get props => [];
}

final class FetchProvinceInitial extends FetchProvinceState {}

final class FetchProvinceLoading extends FetchProvinceState {}

final class FetchProvinceSuccess extends FetchProvinceState {
  final List<Province> provinces;

  FetchProvinceSuccess(this.provinces);
}

final class FetchProvinceFailure extends FetchProvinceState {}
