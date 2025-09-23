
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_password_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_response.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateResponse> updateProfile(UpdateRequest request);
  
  Future<DeleteResponse> deleteProfile(DeleteRequest request);
  Future<ResetResponse> resetPassword(ResetPasswordRequest request);
  Future<GetProfileResponse> getProfile(GetProfileRequest request);

}
