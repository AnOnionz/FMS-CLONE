part of 'necessary_bloc.dart';

sealed class NecessaryEvent {}

class NecessaryIn extends NecessaryEvent {
  final FeatureEntity feature;

  NecessaryIn({required this.feature});
}

class NecessaryOut extends NecessaryEvent {
  final Function action;
  final FeatureEntity feature;

  NecessaryOut(this.action, {required this.feature});
}

class NecessarySignOut extends NecessaryEvent {
  final String functionName;
  final Function action;
  final Function onClose;

  NecessarySignOut(
      {required this.functionName,
      required this.action,
      required this.onClose});
}
