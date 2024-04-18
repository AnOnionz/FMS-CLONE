import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/authentication/domain/usecases/change_pass_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/login_usecase.dart';
import '../../../authentication/domain/usecases/logout_usecase.dart';
import '../../../authentication/presentation/blocs/authentication_bloc.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final LoginUsecase _login;
  final LogoutUsecase _logout;
  final ChangePassUsecase _changePass;

  late final AuthenticationBloc _authenticationBloc;

  SignBloc(
      this._authenticationBloc, this._login, this._logout, this._changePass)
      : super(const SignInitial()) {
    on<SignInButtonPressed>(
      _onSignInButtonPressed,
      transformer: droppable(),
    );
    on<SignOutButtonPressed>(
      _onSignOutButtonPressed,
      transformer: droppable(),
    );
    on<RequestChangePassworkButtonPressed>(
      _onRequestChangePassworkButtonPressed,
      transformer: droppable(),
    );
  }

  Future<void> _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<SignState> emit) async {
    emit(const SignLoading());
    final execute = await _login();
    execute.fold((fail) async => emit(SignFailure(fail)), (credentials) async {
      if (credentials == null) {
        return emit(SignCancel());
      } else {
        _authenticationBloc.add(AuthenticationLoginSuccess(credentials));
        return emit(SignSuccess(SignStatus.logged));
      }
    });
  }

  Future<void> _onSignOutButtonPressed(
      SignOutButtonPressed event, Emitter<SignState> emit) async {
    emit(const SignLoading());
    OverlayManager.showLoading();
    final execute = await _logout();
    execute.fold((fail) async {
      OverlayManager.showLoading();
      emit(SignFailure(fail));
    }, (success) async {
      if (success) {
        OverlayManager.showLoading();
        _authenticationBloc.add(AuthenticationLogoutSuccess());
        return emit(SignSuccess(SignStatus.loggedOut));
      }
    });
  }

  Future<void> _onRequestChangePassworkButtonPressed(
      RequestChangePassworkButtonPressed event, Emitter<SignState> emit) async {
    emit(const SignLoading());
    final execute = await _changePass();
    execute.fold((fail) async {
      OverlayManager.showSnackbar(
          snackbar:
              SnackBar(content: Text(fail.message ?? 'Gửi yêu cầu thất bại')));
      return emit(SignFailure(fail));
    }, (success) async {
      OverlayManager.showSnackbar(
          snackbar: SnackBar(content: Text('Yêu cầu đã được gửi')));
      return emit(SignSuccess(SignStatus.passwordChanged));
    });
  }
}
