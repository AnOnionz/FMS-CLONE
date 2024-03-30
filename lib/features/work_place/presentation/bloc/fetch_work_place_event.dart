part of 'fetch_work_place_bloc.dart';

sealed class FetchWorkPlaceEvent extends Equatable {
  const FetchWorkPlaceEvent();

  @override
  List<Object> get props => [];
}

class FetchProjects extends FetchWorkPlaceEvent {}

class FetchBooths extends FetchWorkPlaceEvent {
  final WorkPlaceEntity workPlace;

  FetchBooths({required this.workPlace});
}

class FetchOutlets extends FetchWorkPlaceEvent {
  final WorkPlaceEntity workPlace;

  FetchOutlets({required this.workPlace});
}

class FetchConfigs extends FetchWorkPlaceEvent {
  final WorkPlaceEntity workPlace;

  FetchConfigs({required this.workPlace});
}
