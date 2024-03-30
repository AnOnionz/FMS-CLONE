part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationStarted extends AuthenticationEvent {}

final class AuthenticationLogoutRequested extends AuthenticationEvent {
  const AuthenticationLogoutRequested();
}

final class AuthenticationLoginRequested extends AuthenticationEvent {
  const AuthenticationLoginRequested();
}
