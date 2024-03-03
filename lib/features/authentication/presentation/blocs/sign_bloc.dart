import 'package:bloc/bloc.dart';

import '../../domain/usecases/logout_usecase.dart';
import '/core/errors/failure.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/usecases/login_usecase.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  SignBloc({required this.loginUsecase, required this.logoutUsecase})
      : super(SignInitial()) {
    on<SignUp>(_onSignUp);
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<SignState> emit,
  ) async {
    emit(SignProgress());
    final execute = await loginUsecase(
        LoginParams(username: event.username, password: event.password));
    execute.fold((fail) => emit(SignFailure(fail)),
        (success) => emit(SignSuccess(status: SignStatus.logged)));
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<SignState> emit,
  ) async {
    emit(SignProgress());
    final execute = await logoutUsecase(NoParams());
    execute.fold((fail) => emit(SignFailure(fail)),
        (success) => emit(SignSuccess(status: SignStatus.loggedOut)));
  }

  Future<void> _onSignUp(
    SignUp event,
    Emitter<SignState> emit,
  ) async {}
}
