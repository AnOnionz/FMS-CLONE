part of 'sync_progress_bloc.dart';

sealed class SyncProgressState {}

final class SyncProgressInitial extends SyncProgressState {}

final class SyncProgressLoading extends SyncProgressState {}

final class SyncProgressSuccess extends SyncProgressState {}

final class SyncProgressFailure extends SyncProgressState {
  final Failure failure;

  SyncProgressFailure(this.failure);
}
