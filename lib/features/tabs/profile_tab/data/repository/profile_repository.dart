import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/auth/data/data_source/remote/auth_remote_api_data_source.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/data_source/remote/profile_remote_api_data_source.dart';
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

class ProfileRepository {
  final ProfileAPIDataSource _profileRemoteAPIDataSource =
      ProfileAPIDataSource();

  Future<Either<Failure, UpdateResponse>> updateProfile(
    UpdateRequest request,
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.updateProfile(request);
      return Right(response);
    } on UpdateProfileException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, ResetResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.resetPassword(request);

      return Right(response);
    } on ResetPasswordException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, GetProfileResponse>> getProfile(
 
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.getProfile();

      return Right(response);
    } on GetProfileException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, DeleteResponse>> deleteProfile(
  
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.deleteProfile();

      return Right(response);
    } on DeleteProfileException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, AddResponse>> addToWishList(AddRequest request) async {
    try {
      final response = await _profileRemoteAPIDataSource.addToWishList(request);

      return Right(response);
    } on AddToWishListException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, GetMovieResponse>> getAllWishList(
    GetMovieRequest request,
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.getAllWishList(
        request,
      );

      return Right(response);
    } on GetWishListException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, IsFavResponse>> isFromWishList(
   int id
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.isFromWishList(
        id,
      );

      return Right(response);
    } on CheckIsFavWishListException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, RemoveMovieResponse>> removeFromWishList(
    int movieId
  ) async {
    try {
      final response = await _profileRemoteAPIDataSource.removeFromWishList(
       movieId
      );
      print('done');
      return Right(response);
    } on DeleteFromWishListException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
