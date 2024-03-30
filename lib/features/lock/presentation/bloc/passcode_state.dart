part of 'passcode_bloc.dart';

sealed class PasscodeState extends Equatable {
  const PasscodeState();
  @override
  List<Object> get props => [];
}

final class PasscodeInitial extends PasscodeState {
  const PasscodeInitial();
}

final class PasscodeLoading extends PasscodeState {
  const PasscodeLoading();
}

final class PasscodeSuccess extends PasscodeState {
  const PasscodeSuccess();
}
