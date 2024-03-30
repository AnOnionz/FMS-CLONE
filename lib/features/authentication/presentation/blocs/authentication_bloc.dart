import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/authentication/domain/usecases/login_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/logout_usecase.dart';
import '../../domain/usecases/get_credentials_usecase.dart';
import '../../domain/usecases/has_valid_credentials_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required LogoutUsecase logoutUsecase,
    required LoginUsecase loginUsecase,
    required HasValidCredentialsUsecase hasValidCredentialsUsecase,
    required GetCredentialsUsecase getCredentialsUsecase,
  }) : super(const AuthenticationState.unknown()) {
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

    on<AuthenticationLoginRequested>(
      (event, emit) async {
        final login = await loginUsecase();
        login.fold((fail) => emit(AuthenticationState.failure(fail)),
            (success) => emit(AuthenticationState.authenticated(success!)));
      },
      transformer: droppable(),
    );

    on<AuthenticationLogoutRequested>(
      (event, emit) async {
        final logout = await logoutUsecase();
        logout.fold((fail) => emit(AuthenticationState.failure(fail)),
            (success) => emit(const AuthenticationState.unauthenticated()));
      },
      transformer: droppable(),
    );
  }
}
