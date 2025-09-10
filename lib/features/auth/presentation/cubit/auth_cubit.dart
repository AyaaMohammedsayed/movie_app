import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/models/login_requeest.dart';
import 'package:movie_app/features/auth/data/models/register_reguest.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repositories.dart';
import 'package:movie_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepositories _repository = AuthRepositories();

  Future<void> register(RegisterReguest request) async {
    emit(RegisterLoading());
    try {
      await _repository.register(request);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  Future<void> login(LoginRequeest request) async {
    emit(LoginLoading());
    try {
      await _repository.login(request);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}
