part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}

final class AuthenticationLogoutSuccess extends AuthenticationEvent {}

final class AuthenticationLoginSuccess extends AuthenticationEvent {
  final Credentials credentials;

  AuthenticationLoginSuccess(this.credentials);
}
