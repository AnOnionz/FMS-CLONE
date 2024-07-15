part of 'sampling_bloc.dart';

abstract class SamplingState extends Equatable {
  const SamplingState();

  @override
  List<Object> get props => [];
}

class SamplingInitial extends SamplingState {}

class SamplingLoading extends SamplingState {}

class SamplingSuccess extends SamplingState {
  final SamplingEntity entity;

  SamplingSuccess({required this.entity});
}

class SamplingFailure extends SamplingState {
  final Failure failure;

  SamplingFailure(this.failure);
}
