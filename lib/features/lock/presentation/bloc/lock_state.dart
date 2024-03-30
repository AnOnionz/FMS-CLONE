part of 'lock_bloc.dart';

typedef ValidatePasscodeCallback = Future<bool> Function(String passcode);
typedef AuthenticateBiometricsCallback = Future<bool> Function();

sealed class LockState extends Equatable {
  const LockState();
  @override
  List<Object?> get props => [];
}

final class LockInitial extends LockState {
  const LockInitial();
}

final class LockLoading extends LockState {
  const LockLoading();
}

final class LockSuccess extends LockState {
  final ValidatePasscodeCallback validatePasscode;
  final AuthenticateBiometricsCallback? authenticate;
  final bool canAuthenticateWithBiometrics;
  final bool isSaved;
  final bool isDeleted;

  const LockSuccess({
    required this.validatePasscode,
    required this.canAuthenticateWithBiometrics,
    this.isSaved = false,
    this.isDeleted = false,
    this.authenticate,
  });

  LockSuccess copyWith({
    ValidatePasscodeCallback? validatePasscode,
    bool? canAuthenticateWithBiometrics,
    bool? isSaved,
    bool? isDeleted,
    AuthenticateBiometricsCallback? authenticate,
  }) {
    return LockSuccess(
      validatePasscode: validatePasscode ?? this.validatePasscode,
      canAuthenticateWithBiometrics:
          canAuthenticateWithBiometrics ?? this.canAuthenticateWithBiometrics,
      isSaved: isSaved ?? this.isSaved,
      isDeleted: isDeleted ?? this.isDeleted,
      authenticate: authenticate ?? this.authenticate,
    );
  }

  @override
  List<Object?> get props => [
        validatePasscode,
        canAuthenticateWithBiometrics,
        isSaved,
        isDeleted,
        authenticate,
      ];
}

final class LockFailure extends LockState {
  const LockFailure();
}
