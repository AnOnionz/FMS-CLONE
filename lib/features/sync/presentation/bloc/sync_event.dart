// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sync_bloc.dart';

abstract class SyncEvent {
  const SyncEvent();
}

class SyncStarted extends SyncEvent {}

class SyncUpdated extends SyncEvent {
  final FeatureEntity feature;
  final List<dynamic> data;

  SyncUpdated({required this.feature, required this.data});
}
