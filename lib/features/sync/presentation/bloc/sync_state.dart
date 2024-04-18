part of 'sync_bloc.dart';

final class SyncState extends Equatable {
  const SyncState._({
    this.status = SyncStatus.synced,
    this.features = const {},
  });

  const SyncState.init() : this._();

  const SyncState.successfully()
      : this._(
          status: SyncStatus.synced,
        );

  const SyncState.expectation(Set<FeatureType> features)
      : this._(status: SyncStatus.noSynced, features: features);

  final SyncStatus status;
  final Set<FeatureType> features;

  @override
  String toString() {
    return '${runtimeType}($status)';
  }

  @override
  List<Object?> get props => [status, features];
}
