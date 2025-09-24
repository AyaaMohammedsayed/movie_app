import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/token_user/token.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/data_source/remote/profile_remote_data_source.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/add_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/add_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_movie_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_movie_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/is_fav_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/is_fav_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/remove_movie_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/remove_movie_response.dart';
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
  Future<DeleteResponse> deleteProfile() async {
    try {
      final token = await getToken();
      final response = await _dio.delete(
        ConstantAPI.updateProfileEndPoint,

        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
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
        ),
      );

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
      throw ResetPasswordException(message ?? "Failed to update password");
    }
  }

  @override
  Future<GetProfileResponse> getProfile() async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        ConstantAPI.updateProfileEndPoint,

        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
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
      throw GetProfileException(message ?? "Failed to get Data Profile");
    }
  }

  Future<AddResponse> addToWishList(AddRequest request) async {
    try {
      final token = await getToken();
      final response = await _dio.post(
        ConstantAPI.addToWishListEndPoint,
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
       print("${response.data} addddddddddddddddddddddddddd");
      return AddResponse.fromJson(response.data);
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
      throw AddToWishListException(message ?? "Failed to add to WhishList");
    }
  }

  Future<GetMovieResponse> getAllWishList(GetMovieRequest request) async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        ConstantAPI.getAllWishListEndPoint,

        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return GetMovieResponse.fromJson(response.data);
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
      throw GetWishListException(message ?? "Failed to Get WhishList");
    }
  }

  Future<IsFavResponse> isFromWishList(int movieId) async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        "${ConstantAPI.isFavMovieEndPoint}${movieId}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print("${response.data} addddddddddddddddddddddddddd");
      return IsFavResponse.fromJson(response.data);
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
      throw CheckIsFavWishListException(
        message ?? "Failed to Check if is Fav in WhishList",
      );
    }
  }

  Future<RemoveMovieResponse> removeFromWishList(
    int movieId
  ) async {
    try {
      final token = await getToken();
      final response = await _dio.delete(
        "${ConstantAPI.deleteMovieWishListEndPoint}${movieId}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
 print("${response.data} addddddddddddddddddddddddddd");
      return RemoveMovieResponse.fromJson(response.data);
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
      throw DeleteFromWishListException(
        message ?? "Failed to remove movie from wishlist",
      );
    }
  }
}
