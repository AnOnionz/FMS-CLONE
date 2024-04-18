part of 'sync_bloc.dart';

final class SyncState extends Equatable {
  const SyncState._({this.status = SyncStatus.synced, this.data = const {}});

  const SyncState.init() : this._();

  const SyncState.successfully() : this._();

  const SyncState.expectation({required Map<FeatureType, List<dynamic>> data})
      : this._(data: data, status: SyncStatus.noSynced);

  final Map<FeatureType, List<dynamic>> data;
  final SyncStatus status;

  @override
  List<Object?> get props => [data];
}
