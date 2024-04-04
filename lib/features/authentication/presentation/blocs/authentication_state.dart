part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

final class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.credentials,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Credentials credentials)
      : this._(
            status: AuthenticationStatus.authenticated,
            credentials: credentials);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Credentials? credentials;

  @override
  String toString() {
    return '${runtimeType}($status)';
  }

  @override
  List<Object?> get props => [status, credentials];
}
