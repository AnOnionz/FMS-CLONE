part of 'sampling_bloc.dart';

abstract class SamplingState extends Equatable {
  const SamplingState();  

  @override
  List<Object> get props => [];
}
class SamplingInitial extends SamplingState {}
