part of 'sign_bloc.dart';

sealed class SignEvent {
  const SignEvent();
}

final class SignInButtonPressed extends SignEvent {
  const SignInButtonPressed();
}

final class SignOutButtonPressed extends SignEvent {
  const SignOutButtonPressed();
}

final class RequestChangePassworkButtonPressed extends SignEvent {
  const RequestChangePassworkButtonPressed();
}

final class SignStatusResponded extends SignEvent {
  final SignStatus status;
  const SignStatusResponded(this.status);
}
