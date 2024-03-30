part of 'passcode_bloc.dart';

sealed class PasscodeEvent extends Equatable {
  const PasscodeEvent();
  @override
  List<Object> get props => [];
}

final class PasscodeDeleted extends PasscodeEvent {
  const PasscodeDeleted();
}

final class PasscodeSaved extends PasscodeEvent {
  final String passcode;
  const PasscodeSaved(this.passcode);
  @override
  List<Object> get props => [passcode];
}

final class PasscodeValidated extends PasscodeEvent {
  final String passcode;
  const PasscodeValidated(this.passcode);
  @override
  List<Object> get props => [passcode];
}
