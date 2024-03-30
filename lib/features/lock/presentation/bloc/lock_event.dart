part of 'lock_bloc.dart';

sealed class LockEvent extends Equatable {
  const LockEvent();
  @override
  List<Object> get props => [];
}

final class LockStarted extends LockEvent {
  const LockStarted();
}

final class LockPasscodeDeleted extends LockEvent {
  const LockPasscodeDeleted();
}

final class LockPasscodeSaved extends LockEvent {
  final String passcode;
  const LockPasscodeSaved(this.passcode);
  @override
  List<Object> get props => [passcode];
}
