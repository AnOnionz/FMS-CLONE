import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

import '../../domain/usecases/delete_passcode_usecase.dart';
import '../../domain/usecases/has_passcode_usecase.dart';
import '../../domain/usecases/save_passcode_usecase.dart';
import '../../domain/usecases/validate_passcode_usecase.dart';

part 'lock_event.dart';
part 'lock_state.dart';

class LockBloc extends Bloc<LockEvent, LockState> {
  final ValidatePasscodeUsecase validatePasscodeUsecase;
  final HasPasscodeUsecase hasPasscodeUsecase;
  final SavePasscodeUsecase savePasscodeUsecase;
  final DeletePasscodeUsecase deletePasscodeUsecase;

  final _auth = LocalAuthentication();

  LockBloc({
    required this.validatePasscodeUsecase,
    required this.hasPasscodeUsecase,
    required this.savePasscodeUsecase,
    required this.deletePasscodeUsecase,
  }) : super(const LockInitial()) {
    on<LockStarted>(_onLockStarted);
    on<LockPasscodeDeleted>(_onLockPasscodeDeleted);
    on<LockPasscodeSaved>(_onLockPasscodeSaved);
  }

  Future<void> _onLockStarted(
      LockStarted event, Emitter<LockState> emit) async {
    emit(const LockLoading());

    final hasPasscode = await hasPasscodeUsecase();
    hasPasscode.fold((fail) => emit(const LockFailure()), (success) => null);

    final canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();

    final availableBiometrics = await _auth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {}

    emit(
      LockSuccess(
        // validatePasscode: validatePasscodeUsecase.call,
        validatePasscode: (value) async => true,
        canAuthenticateWithBiometrics: canAuthenticateWithBiometrics,
        authenticate: canAuthenticate
            ? () async {
                return await _auth.authenticate(
                  localizedReason: 'Please authenticate to open the app',
                  options: const AuthenticationOptions(biometricOnly: true),
                );
              }
            : null,
      ),
    );
  }

  Future<void> _onLockPasscodeDeleted(
    LockPasscodeDeleted event,
    Emitter<LockState> emit,
  ) async {
    await deletePasscodeUsecase();
    final currentState = state;
    if (currentState is LockSuccess) {
      emit(currentState.copyWith(isSaved: false, isDeleted: true));
    }
  }

  Future<void> _onLockPasscodeSaved(
    LockPasscodeSaved event,
    Emitter<LockState> emit,
  ) async {
    await savePasscodeUsecase(event.passcode);
    final currentState = state;
    if (currentState is LockSuccess) {
      emit(currentState.copyWith(isSaved: true, isDeleted: false));
    }
  }
}
