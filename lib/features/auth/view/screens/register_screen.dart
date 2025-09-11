import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/features/auth/view/widgets/custom_circle_avatar.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/features/tabs/profile_tab/widgets/modal_bottom_sheet.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register_screen';

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool eg = true;
  bool en = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onTap() {
    if (formKey.currentState!.validate()) {
      UiUtils.showSuccessMessage(AppTexts.registerSuccess);
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    } else {
      UiUtils.showErrorMessage(AppTexts.registerFailed);
    }
  }
  int profile = 1;
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(AppTexts.register)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return ModalBottomSheet(
                        selectedItem: selectedItem,
                        onSelect: (newProfile, newIndex) {
                          setState(() {
                            profile = newProfile;
                            selectedItem = newIndex;
                          });
                        },
                      );
                    },
                  );
                },
                child: Image.asset(
                  'assets/images/avatar$profile.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 16,),
                  CustomTextFormField(
                    hintText: AppTexts.nameName,
                    controller: nameController,
                    validator: (value) {
                      return Validator.nameValidator(value);
                    },
                    prefixIconName: AppImages.nameIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: AppTexts.mailName,
                    controller: emailController,
                    validator: (value) {
                      return Validator.emailValidator(value);
                    },
                    prefixIconName: AppImages.mailIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: AppTexts.passName,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.passwordValidator(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                   CustomTextFormField(
                    hintText: AppTexts.confirmPassName,
                    controller: comfirmPasswordController,
                    validator: (value) {
                      return Validator.passwordValidator(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: AppTexts.phoneName,
                    controller: phoneController,
                    validator: (value) {
                      return Validator.phoneValidator(value);
                    },
                    prefixIconName: AppImages.phoneIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    onTap: onTap,
                    child: Text(AppTexts.createAccount),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTexts.alreadyHaveAccount,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppTexts.login,
                          style: textTheme.labelLarge!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primary),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomCircleAvatar(
                          iconName: AppImages.enIcon,
                          tappedValue: en,
                          onTap: changeLanguage,
                        ),
                        SizedBox(width: 20),
                        CustomCircleAvatar(
                          iconName: AppImages.egIcon,
                          tappedValue: eg,
                          onTap: changeLanguage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeLanguage() {
    if (eg) {
      eg = false;
      en = true;
    } else if (en) {
      en = false;
      eg = true;
    }
    setState(() {});
  }
}
