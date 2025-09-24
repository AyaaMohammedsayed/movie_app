import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/features/tabs/profile_tab/data/model/add_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_movie_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/is_fav_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/remove_movie_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_password_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/repository/profile_repository.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInit());
  final ProfileRepository _repository = ProfileRepository();

  Future<void> updateProfile(UpdateRequest request) async {
    emit(UpdateProfileLoading());
    final user = await _repository.updateProfile(request);
    user.fold(
      (exception) => emit(UpdateProfileError(exception.message)),
      (data) => emit(UpdateProfileSuccess(data)),
    );
  }
  
  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordProfileLoading());
    final user = await _repository.resetPassword(request);
    user.fold(
      (exception) => emit(ResetPasswordProfileError(exception.message)),
      (data) => emit(ResetPasswordProfileSuccess(data)),
    );
  }
  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    final user = await _repository.deleteProfile();
    user.fold(
      (exception) => emit(DeleteProfileError(exception.message)),
      (data) => emit(DeleteProfileSuccess(data)),
    );
  }
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final user = await _repository.getProfile();
    user.fold(
      (exception) => emit(GetProfileError(exception.message)),
      (data) => emit(GetProfileSuccess(data)),
    );
  }

  Future<void> addToWishList(AddRequest request) async {
    emit(AddToWishLoading());
    final user = await _repository.addToWishList(request);
    user.fold(
      (exception) => emit(AddToWishError(exception.message)),
      (data) => emit(AddToWishSuccess(data)),
    );
  }

  Future<void> getWishList(GetMovieRequest request) async {
    emit(GetWishListLoading());
    final user = await _repository.getAllWishList(request);
    user.fold(
      (exception) => emit(GetWishListError(exception.message)),
      (data) => emit(GetWishListSuccess(data)),
    );
  }

  Future<void> checkIsFav(int id) async {
    emit(CheckFavLoading());
    final user = await _repository.isFromWishList(id);
    user.fold(
      (exception) => emit(CheckFavError(exception.message)),
      (data) => emit(CheckFavSuccess(data)),
    );
  }
  Future<void> removeFromWishList(int movieId) async {
    emit(RemoveMovieLoading());
    final user = await _repository.removeFromWishList( movieId);
    user.fold(
      (exception) => emit(RemoveMovieError(exception.message)),
      (data) => emit(RemoveMovieSuccess(data)),
    );
  }



}
