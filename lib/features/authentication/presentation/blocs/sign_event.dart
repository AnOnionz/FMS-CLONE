part of 'sign_bloc.dart';

abstract class SignEvent {
  const SignEvent();
}

class SignUp extends SignEvent {
  final String username;
  final String password;

  SignUp({required this.username, required this.password});
}

class SignIn extends SignEvent {}

class ChangePass extends SignEvent {}

class SignOut extends SignEvent {}
