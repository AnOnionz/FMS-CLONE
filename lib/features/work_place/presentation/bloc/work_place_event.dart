part of 'work_place_bloc.dart';

sealed class WorkPlaceEvent extends Equatable {
  const WorkPlaceEvent();

  @override
  List<Object> get props => [];
}

class ApplyProject extends WorkPlaceEvent {
  final ProjectEntity project;

  ApplyProject(this.project);
}

class ApplyOutlet extends WorkPlaceEvent {
  final OutletEntity outlet;

  ApplyOutlet(this.outlet);
}

class ApplyBooth extends WorkPlaceEvent {
  final BoothEntity booth;

  ApplyBooth(this.booth);
}
