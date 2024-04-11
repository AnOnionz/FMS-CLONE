part of 'general_bloc.dart';

sealed class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

class GeneralStared extends GeneralEvent {
  final GeneralEntity general;

  GeneralStared({required this.general});
}

class GeneralUpdate extends GeneralEvent {
  final AttendanceEntity? attendance;

  GeneralUpdate({required this.attendance});
}
