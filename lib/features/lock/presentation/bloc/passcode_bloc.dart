import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'passcode_event.dart';
part 'passcode_state.dart';

class PasscodeBloc extends Bloc<PasscodeEvent, PasscodeState> {
  PasscodeBloc() : super(const PasscodeInitial()) {
    on<PasscodeDeleted>(_onPasscodeDeleted);
    on<PasscodeSaved>(_onPasscodeSaved);
    on<PasscodeValidated>(_onPasscodeValidated);
  }

  Future<void> _onPasscodeDeleted(
    PasscodeDeleted event,
    Emitter<PasscodeState> emit,
  ) async {}

  Future<void> _onPasscodeSaved(
    PasscodeSaved event,
    Emitter<PasscodeState> emit,
  ) async {}

  Future<void> _onPasscodeValidated(
    PasscodeValidated event,
    Emitter<PasscodeState> emit,
  ) async {}
}
