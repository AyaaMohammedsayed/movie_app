import 'package:movie_app/features/auth/data/models/login_requeest.dart';
import 'package:movie_app/features/auth/data/models/login_response.dart';
import 'package:movie_app/features/auth/data/models/register_reguest.dart';
import 'package:movie_app/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSourse {
  Future<RegisterResponse> register(RegisterReguest request);

  Future<LoginResponse> login(LoginRequeest login);
}
