part of 'app_animation_bloc.dart';

sealed class AppAnimationState extends Equatable {
  const AppAnimationState();
  @override
  List<Object> get props => [];
}

final class AppAnimationInitial extends AppAnimationState {
  const AppAnimationInitial();
}

final class AppAnimationSuccess extends AppAnimationState {
  final AnimationController animationController;
  final AnimationStatus animationStatus;

  const AppAnimationSuccess({
    required this.animationController,
    required this.animationStatus,
  });

  AppAnimationSuccess copyWith({
    AnimationController? animationController,
    AnimationStatus? animationStatus,
  }) {
    return AppAnimationSuccess(
      animationController: animationController ?? this.animationController,
      animationStatus: animationStatus ?? this.animationStatus,
    );
  }

  @override
  List<Object> get props => [animationController, animationStatus];
}
