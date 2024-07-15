part of 'get_samplings_cubit.dart';

sealed class GetSamplingsState extends Equatable {
  const GetSamplingsState();

  @override
  List<Object> get props => [];
}

final class GetSamplingsInitial extends GetSamplingsState {}

final class GetSamplingsLoading extends GetSamplingsState {}

final class GetSamplingsFailure extends GetSamplingsState {
  final Failure failure;

  GetSamplingsFailure(this.failure);
}

final class GetSamplingsSuccess extends GetSamplingsState {
  final SamplingEntity? entity;

  GetSamplingsSuccess({required this.entity});
}
