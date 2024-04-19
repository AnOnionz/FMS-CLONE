// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sync_progress_bloc.dart';

sealed class SyncProgressEvent extends Equatable {
  const SyncProgressEvent();

  @override
  List<Object> get props => [];
}

class SyncProgressStart extends SyncProgressEvent {}
