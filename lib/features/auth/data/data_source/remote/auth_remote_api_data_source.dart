import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/token_user/token.dart';
import 'package:movie_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteAPIDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConstantAPI.authBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

Future<RegisterResponse> register(RegisterRequest request) async {
  try {
    final response = await _dio.post(
      ConstantAPI.registerEndPoint,
      data: request.toJson(),
    );

   
    final loginRequest = LoginRequest(
      email: request.email,
      password: request.password,
    );
    final loginResponse = await login(loginRequest);

    if (loginResponse.data != null) {
      await saveToken(loginResponse.data!);
    }

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

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        ConstantAPI.loginEndPoint,
        data: request.toJson(),
      );

      print("Raw response: ${response.data}");

      final loginResponse = LoginResponse.fromJson(response.data);

      print("Message: ${loginResponse.message}");
      print("Token: ${loginResponse.data}");

      if (loginResponse.data != null) {
        saveToken(loginResponse.data!);
      }

      return loginResponse;
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
@override
Future<LoginResponse> loginWithGoogle(String email, String id) async {
  const googleDefaultPassword = "2832003***ayaA";

  try {
    print(" Trying Google Login for $email");

  
    final loginRequest = LoginRequest(
      email: email,
      password: googleDefaultPassword,
    );
    final response = await login(loginRequest);

    if (response.data != null) {
      await saveToken(response.data!);
      print(" Login success for $email");
    }
    return response;

  } catch (e) {
    print(" LoginWithGoogle error: $e");

   
    if (e is LoginException && e.message.toLowerCase().contains("not found")) {
      print(" User not found, registering new account...");

      final registerRequest = RegisterRequest(
        email: email,
        password: googleDefaultPassword,
        confirmPass: googleDefaultPassword,
        phone: '+2012345678595',
        avatarId: 1,
        name: "Google User",
      );

      try {
        final regResponse = await register(registerRequest);
        print(" Register success: ${regResponse.message}");

     
        final loginRequest = LoginRequest(
          email: email,
          password: googleDefaultPassword,
        );
        final newLoginResponse = await login(loginRequest);

        if (newLoginResponse.data != null) {
          await saveToken(newLoginResponse.data!);
        }
        return newLoginResponse;
      } catch (regError) {
        print(" Register failed: $regError");
        throw Exception("Register failed: $regError");
      }
    }


    if (e is LoginException) {
      throw Exception("LoginWithGoogle failed: ${e.message}");
    }
    throw Exception("Unexpected error in Google login: $e");
  }
}

}
