import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/repository/auth_repository.dart';
import 'package:movie_app/features/auth/presentation/cubit/states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());
  final AuthRepository _repository = AuthRepository();

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final user = await _repository.register(request);
    user.fold(
      (exception) => emit(RegisterError(exception.message)),
      (data) => emit(RegisterSuccess(data)),
    );
  }
  
  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final user = await _repository.login(request);
    user.fold(
      (exception) => emit(LoginError(exception.message)),
      (data) => emit(LoginSuccess(data)),
    );
  }
}
