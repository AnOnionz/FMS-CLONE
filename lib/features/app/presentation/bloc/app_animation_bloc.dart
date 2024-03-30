import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_animation_event.dart';
part 'app_animation_state.dart';

class AppAnimationBloc extends Bloc<AppAnimationEvent, AppAnimationState> {
  AppAnimationBloc() : super(const AppAnimationInitial()) {
    on<AppAnimationCreated>(_onAnimationCreated);
    on<AppAnimationStarted>(_onAnimationStarted);
    on<_AppAnimationStatusChanged>(_onAppAnimationStatusChanged);
  }

  void _animationStatusListener(AnimationStatus status) {
    add(_AppAnimationStatusChanged(status));
  }

  void _onAnimationCreated(
    AppAnimationCreated event,
    Emitter<AppAnimationState> emit,
  ) {
    emit(
      AppAnimationSuccess(
        animationController: event.animationController,
        animationStatus: event.animationController.status,
      ),
    );
  }

  void _onAnimationStarted(
    AppAnimationStarted event,
    Emitter<AppAnimationState> emit,
  ) {
    final currentState = state;
    if (currentState is AppAnimationSuccess) {
      final animationController = currentState.animationController;
      animationController.removeStatusListener(_animationStatusListener);
      animationController.addStatusListener(_animationStatusListener);
      animationController.duration = event.duration;
      animationController.forward();
    }
  }

  void _onAppAnimationStatusChanged(
    _AppAnimationStatusChanged event,
    Emitter<AppAnimationState> emit,
  ) {
    final currentState = state;
    if (currentState is AppAnimationSuccess) {
      emit(currentState.copyWith(animationStatus: event.status));
    }
  }
}
