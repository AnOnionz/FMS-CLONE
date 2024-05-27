import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/features/authentication/domain/usecases/change_pass_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/login_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/logout_success_usecase%20copy.dart';
import 'package:fms/features/authentication/domain/usecases/logout_usecase.dart';
import '../../domain/usecases/get_credentials_usecase.dart';
import '../../domain/usecases/has_valid_credentials_usecase.dart';
import '../../domain/usecases/renew_credentials_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required LogoutUsecase logoutUsecase,
      required LogoutSuccessUsecase logoutSuccess,
      required LoginUsecase loginUsecase,
      required HasValidCredentialsUsecase hasValidCredentialsUsecase,
      required GetCredentialsUsecase getCredentialsUsecase,
      required ChangePassUsecase changePassword,
      required RenewCredentialsUsecase renewCredentials})
      : super(const AuthenticationState.unknown()) {
    on<AuthenticationStarted>(
      (event, emit) async {
        bool hasValidCredentials = false;

        await hasValidCredentialsUsecase()
          ..fold(
              (fail) async => emit(const AuthenticationState.unauthenticated()),
              (success) async {
            hasValidCredentials = true;
          });

        if (hasValidCredentials) {
          await getCredentialsUsecase()
            ..fold(
                (fail) async =>
                    emit(const AuthenticationState.unauthenticated()),
                (success) async {
              Fx.log(success);
              return emit(AuthenticationState.authenticated(success));
            });
        }
      },
      transformer: droppable(),
    );
    on<AuthenticationReFresh>((event, emit) async {
      bool hasValidCredentials = false;

      await hasValidCredentialsUsecase()
        ..fold(
            (fail) async => emit(const AuthenticationState.unauthenticated()),
            (success) async {
          hasValidCredentials = true;
        });
      if (hasValidCredentials) {
        await renewCredentials()
          ..fold(
              (fail) async => emit(const AuthenticationState.unauthenticated()),
              (success) async =>
                  emit(AuthenticationState.authenticated(success)));
      }
    });

    on<AuthenticationLogin>(
      (event, emit) async {
        emit(AuthenticationState.authenticated(event.credentials));
      },
      transformer: droppable(),
    );

    on<AuthenticationLogout>(
      (event, emit) async {
        await logoutSuccess();
        emit(const AuthenticationState.unauthenticated());
      },
      transformer: droppable(),
    );
  }
}
