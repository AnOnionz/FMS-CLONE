part of 'config_bloc.dart';

sealed class ConfigState extends Equatable {
  const ConfigState();

  @override
  List<Object> get props => [];
}

final class ConfigInitial extends ConfigState {}

final class ConfigLoading extends ConfigState {}

final class ConfigSuccess extends ConfigState {}

final class ConfigFailure extends ConfigState {
  final Failure failure;

  ConfigFailure(this.failure);
}
