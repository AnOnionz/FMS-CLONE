part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}

final class AuthenticationChangePasswordRequested extends AuthenticationEvent {}

final class AuthenticationLoginRequested extends AuthenticationEvent {}
