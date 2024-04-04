import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/authentication/domain/usecases/change_pass_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/login_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/logout_usecase.dart';
import '../../domain/usecases/get_credentials_usecase.dart';
import '../../domain/usecases/has_valid_credentials_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required LogoutUsecase logoutUsecase,
      required LoginUsecase loginUsecase,
      required HasValidCredentialsUsecase hasValidCredentialsUsecase,
      required GetCredentialsUsecase getCredentialsUsecase,
      required ChangePassUsecase changePassword})
      : super(const AuthenticationState.unknown()) {
    on<AuthenticationStarted>(
      (event, emit) async {
        bool hasValidCredentials = false;

        await hasValidCredentialsUsecase()
          ..fold(
              (fail) async => emit(const AuthenticationState.unauthenticated()),
              (success) {
            hasValidCredentials = true;
          });

        if (hasValidCredentials) {
          await getCredentialsUsecase()
            ..fold((fail) => emit(const AuthenticationState.unauthenticated()),
                (success) => emit(AuthenticationState.authenticated(success)));
        }
      },
      transformer: droppable(),
    );

    on<AuthenticationLoginSuccess>(
      (event, emit) async {
        emit(AuthenticationState.authenticated(event.credentials));
      },
      transformer: droppable(),
    );

    on<AuthenticationLogoutSuccess>(
      (event, emit) async {
        emit(const AuthenticationState.unauthenticated());
      },
      transformer: droppable(),
    );
  }
}
