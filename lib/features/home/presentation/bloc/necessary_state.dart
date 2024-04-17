part of 'necessary_bloc.dart';

sealed class NecessaryState {}

final class NecessaryInit extends NecessaryState {}

final class NecessaryStateHasData extends NecessaryState {
  final GeneralEntity general;
  final FeatureEntity feature;

  NecessaryStateHasData({required this.general, required this.feature});
}

final class NecessaryLockIn extends NecessaryStateHasData {
  NecessaryLockIn({required super.general, required super.feature});
}

final class NecessaryUnfastenIn extends NecessaryStateHasData {
  NecessaryUnfastenIn({required super.general, required super.feature});
}

final class NecessaryLockOut extends NecessaryState {
  final GeneralEntity general;
  final List<FeatureEntity> features;
  NecessaryLockOut({
    required this.features,
    required this.general,
  });
}

final class NecessarySync extends NecessaryState {
  final Function onClose;
  NecessarySync({required this.onClose});
}

final class NecessaryAttendanceOut extends NecessaryStateHasData {
  NecessaryAttendanceOut({required super.general, required super.feature});
}

final class NecessaryTask extends NecessaryState {
  final GeneralEntity general;
  final Function onClose;
  final List<FeatureEntity> features;
  NecessaryTask(
      {required this.features, required this.onClose, required this.general});
}

final class NecessaryUnfastenOut extends NecessaryState {
  final GeneralEntity general;
  final Function action;
  NecessaryUnfastenOut({required this.action, required this.general});
}
