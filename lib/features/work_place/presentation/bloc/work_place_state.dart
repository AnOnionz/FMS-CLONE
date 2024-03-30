part of 'work_place_bloc.dart';

class WorkPlaceState extends Equatable {
  final WorkPlaceEntity entity;
  WorkPlaceState({required this.entity});

  factory WorkPlaceState.init() {
    return WorkPlaceState(
        entity: WorkPlaceEntity(project: null, outlet: null, booth: null));
  }

  WorkPlaceState copyWith({
    WorkPlaceEntity? entity,
  }) {
    return WorkPlaceState(
      entity: entity ?? this.entity,
    );
  }

  @override
  String toString() => 'WorkPlaceState($entity)';

  @override
  List<Object?> get props => [entity];
}
