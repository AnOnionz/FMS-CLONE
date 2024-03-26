part of 'sign_bloc.dart';

enum SignStatus { initial, logged, loggedOut, passwordChangeRequestSent }

sealed class SignState {
  const SignState();
}

class SignInitial extends SignState {}

class SignProgress extends SignState {}

class SignCancel extends SignState {}

class SignSuccess extends SignState {
  final SignStatus status;

  SignSuccess({required this.status});
}

class SignFailure extends SignState {
  final Failure failure;

  SignFailure(this.failure);
}
