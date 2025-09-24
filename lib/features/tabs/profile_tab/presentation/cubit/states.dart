import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/add_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_movie_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/is_fav_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/remove_movie_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_response.dart';

abstract class ProfileState {}

class ProfileStateInit extends ProfileState {}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final UpdateResponse updateResponse;

  UpdateProfileSuccess(this.updateResponse);
}

class UpdateProfileError extends ProfileState {
  final String message;

  UpdateProfileError(this.message);
}
class GetProfileLoading extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final GetProfileResponse response;

  GetProfileSuccess(this.response);
}

class GetProfileError extends ProfileState {
  final String message;

  GetProfileError(this.message);
}

class DeleteProfileLoading extends ProfileState {}

class DeleteProfileSuccess extends ProfileState {
  final DeleteResponse deleteResponse;

  DeleteProfileSuccess(this.deleteResponse);
}


class DeleteProfileError extends ProfileState {
  final String message;

  DeleteProfileError(this.message);
}
class ResetPasswordProfileLoading extends ProfileState {}


class ResetPasswordProfileSuccess extends ProfileState {
  final ResetResponse resetResponse;

  ResetPasswordProfileSuccess(this.resetResponse);
}


class ResetPasswordProfileError extends ProfileState {
  final String message;

  ResetPasswordProfileError(this.message);
}
class AddToWishLoading extends ProfileState {}
class AddToWishSuccess extends ProfileState {
  final AddResponse addResponse;

  AddToWishSuccess(this.addResponse);
}
class  AddToWishError extends ProfileState {
  final String message;

  AddToWishError(this.message);
}
class GetWishListLoading extends ProfileState {}
class GetWishListSuccess extends ProfileState {
  final GetMovieResponse getMovieResponse;

  GetWishListSuccess(this.getMovieResponse);
}
class  GetWishListError extends ProfileState {
  final String message;

  GetWishListError(this.message);
}
class CheckFavLoading extends ProfileState {}
class CheckFavSuccess extends ProfileState {
  final IsFavResponse isFavResponse;

  CheckFavSuccess(this.isFavResponse);
}
class  CheckFavError extends ProfileState {
  final String message;

  CheckFavError(this.message);
}
class RemoveMovieLoading extends ProfileState {}
class  RemoveMovieSuccess extends ProfileState {
  final RemoveMovieResponse removeMovieResponse;

  RemoveMovieSuccess(this.removeMovieResponse);
}
class   RemoveMovieError extends ProfileState {
  final String message;

  RemoveMovieError(this.message);
}