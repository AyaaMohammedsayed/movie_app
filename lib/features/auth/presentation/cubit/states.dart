import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';

abstract class AuthState {}

class AuthInit extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final RegisterResponse registerResponse;

  RegisterSuccess(this.registerResponse);
}

class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}


class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}
