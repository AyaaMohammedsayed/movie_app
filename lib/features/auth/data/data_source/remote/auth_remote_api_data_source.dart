import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/token_user/token.dart';
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
        await saveToken(loginResponse.data!);
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
  Future<LoginResponse> loginWithGoogle(String email, String id,String name) async {
    const googleDefaultPassword = "2832003***ayaA";

    try {
      print("Trying Google Login for $email");

      final loginRequest = LoginRequest(
        email: email,
        password: googleDefaultPassword,
      );

      final response = await login(loginRequest);

      if (response.data != null) {
        await saveToken(response.data!);
        print("Login success for $email");
      }

      return response;
    } catch (e) {
      print("LoginWithGoogle error type: ${e.runtimeType}");

      if (e is LoginException &&
          (e.message.toLowerCase().contains("not found") ||
              e.message.toLowerCase().contains("does not exist"))) {
        print("LoginWithGoogle error: ${e.message}");
        print("User not found, registering new account...");

        final registerRequest = RegisterRequest(
          email: email,
          password: googleDefaultPassword,
          confirmPass: googleDefaultPassword,
          phone: '+201226578094',
          avatarId: 1,
          name: name,
        );

        try {
          final regResponse = await register(registerRequest);
          print("Register success: ${regResponse.message}");

          // تسجيل الدخول بعد التسجيل
          final loginRequest = LoginRequest(
            email: email,
            password: googleDefaultPassword,
          );
          final newLoginResponse = await login(loginRequest);

          if (newLoginResponse.data != null) {
            await saveToken(newLoginResponse.data!);
            print("Login after register success for $email");
            print("Login after register success for $name");
          }

          return newLoginResponse;
        } catch (regError) {
          if (regError is RegisterException) {
            print("Register failed message: ${regError.message}");
            throw Exception("Register failed: ${regError.message}");
          }
          throw Exception("Unexpected Register error: $regError");
        }
      }

      if (e is LoginException) {
        throw Exception("LoginWithGoogle failed: ${e.message}");
      }

      throw Exception("Unexpected error in Google login: $e");
    }
  }
}
