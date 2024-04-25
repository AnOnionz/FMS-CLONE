part of 'sync_bloc.dart';

final class SyncState extends Equatable {
  const SyncState._(
      {this.status = SyncStatus.synced, this.number = 0, this.data = const {}});

  const SyncState.init() : this._();

  const SyncState.successfully() : this._();

  const SyncState.expectation(
      {required Map<FeatureEntity, List<DataEntity>> data, required int number})
      : this._(status: SyncStatus.isNoSynced, data: data, number: number);

  final Map<FeatureEntity, List<DataEntity>> data;
  final SyncStatus status;
  final int number;

  @override
  List<Object?> get props => [status, number, data];

  @override
  String toString() {
    return 'SyncState(${status})';
  }
}
