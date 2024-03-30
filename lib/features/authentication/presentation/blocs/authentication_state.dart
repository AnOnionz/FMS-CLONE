part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

final class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown,
      this.credentials,
      this.failure});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Credentials credentials)
      : this._(
            status: AuthenticationStatus.authenticated,
            credentials: credentials);

  const AuthenticationState.failure(Failure failure)
      : this._(status: AuthenticationStatus.unauthenticated, failure: failure);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Credentials? credentials;
  final Failure? failure;

  @override
  List<Object?> get props => [status, credentials];
}
