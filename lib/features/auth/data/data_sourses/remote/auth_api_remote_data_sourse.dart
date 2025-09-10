import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/features/auth/data/data_sourses/remote/auth_remote_data_sourse.dart';
import 'package:movie_app/features/auth/data/models/login_requeest.dart';
import 'package:movie_app/features/auth/data/models/login_response.dart';
import 'package:movie_app/features/auth/data/models/register_reguest.dart';
import 'package:movie_app/features/auth/data/models/register_response.dart';

class AuthApiRemoteDataSourse implements AuthRemoteDataSourse {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ConstantApi.baseURL, receiveDataWhenStatusError: true),
  );

  @override
  Future<LoginResponse> login(LoginRequeest request) async {
    final response = await _dio.post(
      ConstantApi.loginEndPoint,
      data: request.toJson(),
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterReguest request) async {
    final response = await _dio.post(
      ConstantApi.registerEndPoint,
      data: request.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }
}
