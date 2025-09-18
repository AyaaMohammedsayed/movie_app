import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';

class AuthRemoteAPIDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConstantAPI.authBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        ConstantAPI.registerEndPoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        dynamic resMessage = exception.response?.data["message"];
        if (resMessage is List && resMessage.isNotEmpty) {
          message = resMessage[0];
        } else {
          message = resMessage;
        }
      }
      throw RegisterException(message ?? "Failed to register");
    }
  }
  
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        ConstantAPI.loginEndPoint,
        data: request.toJson(),
      );
      print("LOGIN RESPONSE: ${response.data}");
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        dynamic resMessage = exception.response?.data["message"];
        if (resMessage is List && resMessage.isNotEmpty) {
          message = resMessage[0];
        } else {
          message = resMessage;
        }
      }
      throw LoginException(message ?? "Failed to login");
    }
  }


}
