import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../authentication/presentation/blocs/authentication_bloc.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  late final AuthenticationBloc _authenticationBloc;
  late final StreamSubscription<AuthenticationState>
      _authenticationSubscription;

  SignBloc(this._authenticationBloc) : super(const SignInitial()) {
    _authenticationSubscription =
        _authenticationBloc.stream.listen(_onAuthenticationStateChanged);

    on<SignInButtonPressed>(_onSignInButtonPressed);
    on<SignOutButtonPressed>(_onSignOutButtonPressed);
    on<SignStatusResponded>(_onSignStatusResponded);
  }

  void _onAuthenticationStateChanged(AuthenticationState authState) {
    add(
      SignStatusResponded(
        authState.failure != null
            ? SignStatus.failure
            : authState.status == AuthenticationStatus.unauthenticated
                ? SignStatus.loggedOut
                : SignStatus.logged,
      ),
    );
  }

  void _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<SignState> emit) {
    emit(const SignLoading());
    _authenticationBloc.add(const AuthenticationLoginRequested());
  }

  void _onSignOutButtonPressed(
      SignOutButtonPressed event, Emitter<SignState> emit) {
    emit(const SignLoading());
    _authenticationBloc.add(const AuthenticationLogoutRequested());
  }

  void _onSignStatusResponded(
    SignStatusResponded event,
    Emitter<SignState> emit,
  ) {
    return switch (event.status) {
      SignStatus.failure => emit(SignFailure()),
      SignStatus.logCancel => emit(SignCancel()),
      _ => emit(SignSuccess(event.status)),
    };
  }

  @override
  Future<void> close() async {
    _authenticationSubscription.cancel();
    return super.close();
  }
}
