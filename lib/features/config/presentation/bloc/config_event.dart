part of 'config_bloc.dart';

sealed class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class FetchConfig extends ConfigEvent {
  final WorkPlaceEntity workPlace;

  FetchConfig({required this.workPlace});
}
