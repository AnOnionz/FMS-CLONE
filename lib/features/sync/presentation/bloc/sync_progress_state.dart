part of 'sync_progress_bloc.dart';

sealed class SyncProgressState extends Equatable {
  const SyncProgressState();

  @override
  List<Object> get props => [];
}

final class SyncProgressInitial extends SyncProgressState {}

final class SyncProgressLoading extends SyncProgressState {}

final class SyncProgressSuccess extends SyncProgressState {}

final class SyncProgressFailure extends SyncProgressState {
  final Failure failure;

  SyncProgressFailure(this.failure);
}
