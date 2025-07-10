part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  LoginRequested(this.username, this.password);
}

class SignupRequested extends AuthEvent {
  final String username;
  final String password;

  SignupRequested(this.username, this.password);
}
