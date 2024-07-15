part of 'sampling_bloc.dart';

abstract class SamplingEvent extends Equatable {
  const SamplingEvent();

  @override
  List<Object> get props => [];
}

class UpdateSampling extends SamplingEvent {
  final SamplingEntity entity;
  final int attendanceId;
  final int featureId;

  UpdateSampling(
      {required this.entity,
      required this.attendanceId,
      required this.featureId});
}
