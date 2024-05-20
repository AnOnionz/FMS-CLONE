part of 'necessary_bloc.dart';

sealed class NecessaryEvent {}

class NecessaryIn extends NecessaryEvent {
  final FeatureEntity feature;
  final bool isOnline;

  NecessaryIn({required this.feature, this.isOnline = false});
}

class NecessaryOut extends NecessaryEvent {
  final Function action;
  final FeatureEntity feature;

  NecessaryOut(this.action, {required this.feature});
}

class NecessarySignOut extends NecessaryEvent {
  final Function action;
  final Function onClose;

  NecessarySignOut({required this.action, required this.onClose});
}
