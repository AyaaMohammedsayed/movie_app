import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';

import 'package:movie_app/features/auth/presentation/cubit/states.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_profile_request.dart';
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
  Future<void> deleteProfile(DeleteRequest request) async {
    emit(DeleteProfileLoading());
    final user = await _repository.deleteProfile(request);
    user.fold(
      (exception) => emit(DeleteProfileError(exception.message)),
      (data) => emit(DeleteProfileSuccess(data)),
    );
  }
  Future<void> getProfile(GetProfileRequest request) async {
    emit(GetProfileLoading());
    final user = await _repository.getProfile(request);
    user.fold(
      (exception) => emit(GetProfileError(exception.message)),
      (data) => emit(GetProfileSuccess(data)),
    );
  }
}
