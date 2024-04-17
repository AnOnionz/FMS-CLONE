part of 'necessary_bloc.dart';

sealed class NecessaryEvent {}

class NecessaryIn extends NecessaryEvent {
  final GeneralEntity general;
  final FeatureEntity feature;

  NecessaryIn({required this.general, required this.feature});
}

class NecessaryOut extends NecessaryEvent {
  final Function action;
  final GeneralEntity general;
  final FeatureEntity feature;

  NecessaryOut(this.action, {required this.general, required this.feature});
}

class NecessarySignOut extends NecessaryEvent {
  final Function action;
  final Function onClose;
  final GeneralEntity general;

  NecessarySignOut(
      {required this.action, required this.onClose, required this.general});
}
