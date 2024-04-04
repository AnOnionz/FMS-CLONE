part of 'sign_bloc.dart';

enum SignStatus { initial, logged, loggedOut, passwordChanged, failure }

sealed class SignState extends Equatable {
  const SignState();

  @override
  List<Object?> get props => [];
}

final class SignInitial extends SignState {
  const SignInitial();
}

final class SignLoading extends SignState {
  const SignLoading();
}

final class SignSuccess extends SignState {
  final SignStatus status;
  const SignSuccess(this.status);

  @override
  String toString() {
    return '${runtimeType}($status)';
  }

  @override
  List<Object?> get props => [status];
}

final class SignCancel extends SignState {
  const SignCancel();
}

final class SignFailure extends SignState {
  final Failure failure;
  const SignFailure(this.failure);
}
