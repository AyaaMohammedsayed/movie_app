import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_response.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_response.dart';
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
