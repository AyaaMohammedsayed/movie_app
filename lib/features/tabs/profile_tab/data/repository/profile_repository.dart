import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/auth/data/data_source/remote/auth_remote_api_data_source.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/data_source/remote/profile_remote_api_data_source.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
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

  Future<Either<Failure, ResetResponse>> resetPassword(ResetPasswordRequest request) async {
    try {
      final response = await _profileRemoteAPIDataSource.resetPassword(request);
      
      return Right(response);
    } on ResetPasswordException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
  Future<Either<Failure, GetProfileResponse>> getProfile(GetProfileRequest request) async {
    try {
      final response = await _profileRemoteAPIDataSource.getProfile(request);
      
      return Right(response);
    } on GetProfileException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
  Future<Either<Failure, DeleteResponse>> deleteProfile(DeleteRequest request) async {
    try {
      final response = await _profileRemoteAPIDataSource.deleteProfile(request);
      
      return Right(response);
    } on DeleteProfileException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

}
