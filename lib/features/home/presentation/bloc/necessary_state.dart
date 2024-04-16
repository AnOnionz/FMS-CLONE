part of 'necessary_bloc.dart';

sealed class NecessaryState {}

final class NecessaryInitial extends NecessaryState {}

final class NecessaryLoading extends NecessaryState {}

final class NecessaryBlock extends NecessaryState {}

final class NecessaryUncensored extends NecessaryState {
  final FeatureEntity feature;

  NecessaryUncensored({required this.feature});
}
