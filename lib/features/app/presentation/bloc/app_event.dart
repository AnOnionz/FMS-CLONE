part of 'app_bloc.dart';

typedef AppAuthenticationSubscribedCallback = void Function(
  AuthenticationStatus status,
);

sealed class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object> get props => [];
}

final class AppStarted extends AppEvent {
  const AppStarted();
}

final class AppLocked extends AppEvent {
  const AppLocked();
}

final class AppUnlocked extends AppEvent {
  const AppUnlocked();
}

final class AppLifecycleChanged extends AppEvent {
  final AppLifecycleState state;
  const AppLifecycleChanged(this.state);
  @override
  List<Object> get props => [state];
}

final class AppAuthenticationSubscribed extends AppEvent {
  const AppAuthenticationSubscribed();
}

final class AppAuthenticationUnsubscribed extends AppEvent {
  const AppAuthenticationUnsubscribed();
}
