part of 'general_bloc.dart';

sealed class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

class GeneralStared extends GeneralEvent {
  final ProjectEntity project;
  final OutletEntity outlet;

  final BoothEntity booth;
  final ConfigEntity config;

  GeneralStared(
      {required this.project,
      required this.outlet,
      required this.booth,
      required this.config});
}
