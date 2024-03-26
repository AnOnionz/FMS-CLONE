import 'package:bloc/bloc.dart';
import 'package:fms/features/authentication/domain/usecases/change_pass_usecase.dart';

import '../../domain/usecases/logout_usecase.dart';
import '/core/errors/failure.dart';
import '/core/usecase/usecase.dart';
import '/features/authentication/domain/usecases/login_usecase.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final ChangePassUsecase changePassUsecase;
  SignBloc(
      {required this.loginUsecase,
      required this.logoutUsecase,
      required this.changePassUsecase})
      : super(SignInitial()) {
    on<SignUp>(_onSignUp);
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
    on<ChangePass>(_onChangePass);
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<SignState> emit,
  ) async {
    emit(SignProgress());
    final execute = await loginUsecase(NoParams());
    execute.fold((fail) => emit(SignFailure(fail)), (success) {
      if (success) {
        emit(SignSuccess(status: SignStatus.logged));
      } else {
        emit(SignCancel());
      }
    });
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

  Future<void> _onChangePass(
    ChangePass event,
    Emitter<SignState> emit,
  ) async {
    emit(SignProgress());
    final execute = await changePassUsecase(NoParams());
    execute.fold(
        (fail) => emit(SignFailure(fail)),
        (success) =>
            emit(SignSuccess(status: SignStatus.passwordChangeRequestSent)));
  }
}
