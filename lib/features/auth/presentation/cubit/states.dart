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
