part of 'necessary_bloc.dart';

sealed class NecessaryState {}

final class NecessaryInit extends NecessaryState {}

final class NecessaryStateHasData extends NecessaryState {
  final FeatureEntity feature;

  NecessaryStateHasData({required this.feature});
}

final class NecessaryLockIn extends NecessaryStateHasData {
  NecessaryLockIn({required super.feature});
}

final class NecessaryInternet extends NecessaryState {
  NecessaryInternet();
}

final class NecessaryUnfastenIn extends NecessaryStateHasData {
  NecessaryUnfastenIn({required super.feature});
}

final class NecessaryLockOut extends NecessaryState {
  final FeatureEntity feature;
  final List<FeatureEntity> features;
  NecessaryLockOut({
    required this.feature,
    required this.features,
  });
}

final class NecessarySync extends NecessaryState {
  final Function onClose;
  NecessarySync({required this.onClose});
}

final class NecessaryAttendanceOut extends NecessaryStateHasData {
  NecessaryAttendanceOut({required super.feature});
}

final class NecessaryTask extends NecessaryState {
  final Function onClose;
  final List<FeatureEntity> features;
  NecessaryTask({required this.features, required this.onClose});
}

final class NecessaryUnfastenOut extends NecessaryState {
  final Function action;
  NecessaryUnfastenOut({required this.action});
}
