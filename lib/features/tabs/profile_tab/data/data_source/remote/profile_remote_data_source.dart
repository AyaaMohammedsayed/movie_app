
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

abstract class ProfileRemoteDataSource {
  Future<UpdateResponse> updateProfile(UpdateRequest request);
  
  Future<DeleteResponse> deleteProfile();
  Future<ResetResponse> resetPassword(ResetPasswordRequest request);
  Future<GetProfileResponse> getProfile();
  Future<AddResponse> addToWishList(AddRequest request);
  Future<RemoveMovieResponse> removeFromWishList(int movieId);
  Future<GetMovieResponse> getAllWishList(GetMovieRequest request);
  Future<IsFavResponse> isFromWishList(int movieId);

}
