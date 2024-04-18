// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sync_bloc.dart';

abstract class SyncEvent {
  const SyncEvent();
}

class SyncUpdated extends SyncEvent {
  final FeatureType type;

  SyncUpdated({
    required this.type,
  });
}
