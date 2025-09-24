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
  late AppLocalizations appLocalizations;
  String email = '';
  int profile = 1;
  int selectedItem = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.pickAvatar, style: textStyle.titleMedium),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
    
          if (state is DeleteProfileSuccess) {
            UiUtils.showSuccessMessage(state.deleteResponse.message!);
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
          }
          if (state is UpdateProfileSuccess) {
            UiUtils.showSuccessMessage(state.updateResponse.message!);
            Navigator.of(context).pop();
            context.read<ProfileCubit>().getProfile();
          }
          if (state is ResetPasswordProfileSuccess) {
            UiUtils.showSuccessMessage(state.resetResponse.message!);
          }
          if (state is DeleteProfileError ||
              state is UpdateProfileError ||
              state is ResetPasswordProfileError) {
            UiUtils.showErrorMessage((state as dynamic).message);
          }
        },
        builder: (context, state) {
        
          if (state is GetProfileSuccess) {
            userName.text = state.response.data!.name;
            userPhone.text = state.response.data!.phone ?? "";
            profile = state.response.data!.avaterId;
            email = state.response.data!.email;
          }
         
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 37.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _showAvatarSheet(context),
                    child: Image.asset(
                      'assets/images/avatar$selectedItem.png',
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 35.h),
 
                  TextField(
                    controller: userName,
                    style: TextStyle(fontSize: 20.sp, color: AppTheme.white),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        AppImages.userImage,
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // ===== Phone =====
                  TextField(
                    controller: userPhone,
                    style: TextStyle(fontSize: 20.sp, color: AppTheme.white),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        AppImages.phoneImage,
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // ===== Reset Password =====
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => _showResetPasswordBottomSheet(context),
                      child: Text(
                        appLocalizations.restPass,
                        style: textStyle.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.25.h),
                  // ===== Delete Account =====
                  CustomElevatedButton(
                    foregroundColor: AppTheme.white,
                    onTap: () => context.read<ProfileCubit>().deleteProfile(),
                    backgroundColor: AppTheme.red,
                    child: Text(appLocalizations.deleteAccount),
                  ),
                  SizedBox(height: 19.h),
                  // ===== Update Account =====
                  CustomElevatedButton(
                    child: Text(appLocalizations.updataAccount),
                    onTap: () {
                      final updateRequest = UpdateRequest(
                        email:
                            email.isNotEmpty
                                ? email
                                : '${userName.text}@gmail.com',
                        name: userName.text.isNotEmpty ? userName.text : '',
                        phone: userPhone.text.isNotEmpty ? userPhone.text : '',
                        avaterId: selectedItem.toString(), 
                      );
                      context.read<ProfileCubit>().updateProfile(updateRequest);
                    },
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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => ModalBottomSheet(
            selectedItem: profile,
            onSelect: (newProfile, newIndex) {
              setState(() {
                selectedItem = newProfile;
                profile = selectedItem;
              });
            },
          ),
    );
  }

  void _showResetPasswordBottomSheet(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 20.h,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                20.h,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
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
                      await context.read<ProfileCubit>().resetPassword(
                        ResetPasswordRequest(
                          oldPassword: oldPasswordController.text,
                          newPassword: newPasswordController.text,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
