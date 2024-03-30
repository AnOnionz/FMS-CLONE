part of 'sign_bloc.dart';

enum SignStatus { initial, logged, loggedOut, logCancel, failure }

sealed class SignState {
  const SignState();
}

final class SignInitial extends SignState {
  const SignInitial();
}

final class SignLoading extends SignState {
  const SignLoading();
}

final class SignSuccess extends SignState with EquatableMixin {
  final SignStatus status;
  const SignSuccess(this.status);

  @override
  List<Object?> get props => [status];
}

final class SignCancel extends SignState {
  const SignCancel();
}

final class SignFailure extends SignState {
  const SignFailure();
}
