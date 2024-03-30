part of 'app_animation_bloc.dart';

sealed class AppAnimationEvent extends Equatable {
  const AppAnimationEvent();
}

final class AppAnimationCreated extends AppAnimationEvent {
  final AnimationController animationController;
  const AppAnimationCreated(this.animationController);
  @override
  List<Object> get props => [animationController];
}

final class AppAnimationStarted extends AppAnimationEvent {
  final Duration duration;
  const AppAnimationStarted(this.duration);
  @override
  List<Object> get props => [duration];
}

final class _AppAnimationStatusChanged extends AppAnimationEvent {
  final AnimationStatus status;
  const _AppAnimationStatusChanged(this.status);
  @override
  List<Object> get props => [status];
}
