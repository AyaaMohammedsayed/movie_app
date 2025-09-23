import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/token_user/taken.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/data_source/remote/profile_remote_data_source.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_password_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_response.dart';

class ProfileAPIDataSource implements ProfileRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConstantAPI.authBaseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
Future<UpdateResponse> updateProfile(UpdateRequest request) async {
  try {
    final token = await getToken();
    final response = await _dio.patch(
      ConstantAPI.updateProfileEndPoint,
      data: request.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      ),
    );
    return UpdateResponse.fromJson(response.data);
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
    throw UpdateProfileException(message ?? "Failed to update profile");
  }
}

   @override
  Future<DeleteResponse> deleteProfile(DeleteRequest request) async {
    try {
        final token = await getToken();
      final response = await _dio.delete(
        ConstantAPI.updateProfileEndPoint,
        data: request.toJson(),
              options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
              )
      );
   
      return DeleteResponse.fromJson(response.data);
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
      throw DeleteProfileException(message ?? "Failed to Delete");
    }
  }
 @override
 Future<ResetResponse> resetPassword(ResetPasswordRequest request) async {
    try {
      final token = await getToken();
      final response = await _dio.patch(
        ConstantAPI.resetPasswordEndPoint,
        data: request.toJson(),
                      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
              )
      );
      print("LOGIN RESPONSE: ${response.data}");
      return ResetResponse.fromJson(response.data);
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
      throw LoginException(message ?? "Failed to update password");
    }
  }
 @override
 Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        ConstantAPI.updateProfileEndPoint,
        data: request.toJson(),
                      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
              )
      );

      return GetProfileResponse.fromJson(response.data);
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
      throw LoginException(message ?? "Failed to get Data Profile");
    }
  }


}
