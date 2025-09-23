import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/delete_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/reset_password_request.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/update_request.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/profile_cubit.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/states.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/widgets/modal_bottom_sheet.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = '/update_profile';

  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  int profile = 1;
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.pickAvatar, style: textStyle.titleMedium),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // ===== Profile fetching =====
          if (state is GetProfileLoading) UiUtils.showLoading(context);
          if (state is GetProfileSuccess) {
            UiUtils.hideLoading(context);
            UiUtils.showSuccessMessage(state.response.message!);
            userName.text = state.response.data!.name;
            userPhone.text = state.response.data!.phone;
            profile = state.response.data!.avaterId;
          }
          if (state is GetProfileError) {
            UiUtils.hideLoading(context);
            UiUtils.showErrorMessage(state.message);
          }

          // ===== Reset Password =====
          if (state is ResetPasswordProfileLoading) UiUtils.showLoading(context);
          if (state is ResetPasswordProfileSuccess) {
            UiUtils.hideLoading(context);
            UiUtils.showSuccessMessage(state.resetResponse.message!);
          }
          if (state is ResetPasswordProfileError) {
            UiUtils.hideLoading(context);
            UiUtils.showErrorMessage(state.message);
          }

          // ===== Delete Profile =====
          if (state is DeleteProfileLoading) UiUtils.showLoading(context);
          if (state is DeleteProfileSuccess) {
            UiUtils.hideLoading(context);
            UiUtils.showSuccessMessage(state.deleteResponse.message!);
            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
          }
          if (state is DeleteProfileError) {
            UiUtils.hideLoading(context);
            UiUtils.showErrorMessage(state.message);
          }

          // ===== Update Profile =====
          if (state is UpdateProfileLoading) UiUtils.showLoading(context);
          if (state is UpdateProfileSuccess) {
            UiUtils.hideLoading(context);
            UiUtils.showSuccessMessage(state.updateResponse.message!);
            Navigator.of(context).pop();
          }
          if (state is UpdateProfileError) {
            UiUtils.hideLoading(context);
            UiUtils.showErrorMessage(state.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 37.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _showAvatarSheet(context),
                    child: Image.asset(
                      'assets/images/avatar$profile.png',
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 35.h),

                  // ===== UserName =====
                  TextField(
                    controller: userName,
                    style: TextStyle(fontSize: 20.sp, color: const Color.fromARGB(255, 134, 12, 12)),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(AppImages.userImage, width: 30.w, height: 30.h, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ===== Phone =====
                  TextField(
                    controller: userPhone,
                    style: TextStyle(fontSize: 20.sp, color: AppTheme.white),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(AppImages.phoneImage, width: 30.w, height: 30.h, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // ===== Reset Password =====
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => _showResetPasswordBottomSheet(context),
                      child: Text(appLocalizations.restPass, style: textStyle.titleLarge),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.25.h),

                  // ===== Delete Account =====
                  CustomElevatedButton(
                    foregroundColor: AppTheme.white,
                    onTap: () => context.read<ProfileCubit>().deleteProfile(DeleteRequest(name: userName.text)),
                    backgroundColor: AppTheme.red,
                    child: Text(appLocalizations.deleteAccount),
                  ),
                  SizedBox(height: 19.h),

                  // ===== Update Account =====
                  CustomElevatedButton(
                    child: Text(appLocalizations.updataAccount),
                    onTap: () => context.read<ProfileCubit>().updateProfile(UpdateRequest(
                      name: userName.text,
                      phone: userPhone.text,
                      avaterId: profile.toString(),
                    )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAvatarSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModalBottomSheet(
        selectedItem: selectedItem,
        onSelect: (newProfile, newIndex) {
          setState(() {
            profile = newProfile;
            selectedItem = newIndex;
          });
        },
      ),
    );
  }

  void _showResetPasswordBottomSheet(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textStyle = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppTheme.grey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(appLocalizations.restPass, style: textStyle.titleLarge),
              SizedBox(height: 20.h),

              CustomTextFormField(
                hintText: appLocalizations.passName,
                controller: oldPasswordController,
                validator: Validator.validatePassword,
                prefixIconName: AppImages.passIcon,
                isPassword: true,
              ),
              SizedBox(height: 20.h),

              CustomTextFormField(
                hintText: appLocalizations.passName,
                controller: newPasswordController,
                validator: Validator.validatePassword,
                prefixIconName: AppImages.passIcon,
                isPassword: true,
              ),
              SizedBox(height: 25.h),

              CustomElevatedButton(
                child: Text(appLocalizations.restPass),
                onTap: () async {
                  final cubit = context.read<ProfileCubit>();
                  await cubit.resetPassword(ResetPasswordRequest(
                    oldPassword: oldPasswordController.text,
                    newPassword: newPasswordController.text,
                  ));
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}