part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}

final class AuthenticationLogout extends AuthenticationEvent {}

final class AuthenticationLogin extends AuthenticationEvent {
  final Credentials credentials;

  AuthenticationLogin(this.credentials);
}
