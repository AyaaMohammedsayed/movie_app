import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/features/auth/view/widgets/custom_circle_avatar.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool eg = true;
  bool en = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onTap() {
    if (formKey.currentState!.validate()) {
      UiUtils.showSuccessMessage(AppTexts.loginSuccess);
      // Navigator.of(context).pushNamed(HomeScreen.routName);
    } else {
      UiUtils.showErrorMessage(AppTexts.loginFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
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
                  Image.asset(
                    AppImages.logoImage,
                    color: AppTheme.primary,
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.27,
                    fit: BoxFit.fill,
                  ),
                  CustomTextFormField(
                    hintText: AppTexts.mailName,
                    controller: emailController,
                    validator: (value) {
                      return Validator.emailValidator(value);
                    },
                    prefixIconName: AppImages.mailIcon,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomTextFormField(
                    hintText: AppTexts.passName,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.passwordValidator(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.004),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppTexts.forgetPass,
                        style: textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.primary,
                          decorationThickness: 2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomElevatedButton(
                    onTap: onTap,
                    child: Text(AppTexts.login),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTexts.dntHaveAccount,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppTexts.createOne,
                          style: textTheme.labelLarge!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: screenWidth * 0.1,
                          endIndent: 10,
                          thickness: 2,
                          color: AppTheme.primary,
                        ),
                      ),
                      Text(
                        AppTexts.or,
                        style: textTheme.labelLarge!.copyWith(
                          color: AppTheme.primary,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: screenWidth * 0.1,
                          thickness: 2,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.googleIcon),
                        SizedBox(width: 5),
                        Text(
                          AppTexts.googleLogin,
                          style: textTheme.labelSmall!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
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
