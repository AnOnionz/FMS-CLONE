part of 'general_bloc.dart';

sealed class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

class GeneralFetch extends GeneralEvent {
  final WorkPlaceEntity workPlace;

  GeneralFetch({required this.workPlace});
}

class GeneralStared extends GeneralEvent {}

class GeneralReset extends GeneralEvent {}

class GeneralRefresh extends GeneralEvent {
  final AttendanceEntity attendance;

  GeneralRefresh({required this.attendance});
}
