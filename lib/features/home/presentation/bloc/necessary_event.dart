part of 'necessary_bloc.dart';

sealed class NecessaryEvent {}

class NecessaryIn extends NecessaryEvent {
  final GeneralEntity general;
  final FeatureEntity feature;

  NecessaryIn({required this.general, required this.feature});
}

class NecessaryOut extends NecessaryEvent {
  final GeneralEntity general;
  final FeatureEntity feature;

  NecessaryOut({required this.general, required this.feature});
}
