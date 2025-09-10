import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/languages/view/change_language.dart';
import 'package:movie_app/core/languages/view_model/language_state.dart';
import 'package:movie_app/core/languages/view_model/languages_view_model.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/features/auth/view/screens/login_screen.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/features/tabs/profile_tab/widgets/modal_bottom_sheet.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register_screen';
  const RegisterScreen({super.key});

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
  late AppLocalizations appLocalizations;

  void onTap() {
    if (formKey.currentState!.validate()) {
      UiUtils.showSuccessMessage(appLocalizations.requiredField);
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    } else {
      UiUtils.showErrorMessage(appLocalizations.requiredField);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  int profile = 1;
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.register)),
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
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: appLocalizations.nameName,
                    controller: nameController,
                    validator: (value) {
                      return Validator.nameValidator(value);
                    },
                    prefixIconName: AppImages.nameIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: appLocalizations.mailName,
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                    prefixIconName: AppImages.mailIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: appLocalizations.passName,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.validatePassword(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: appLocalizations.confirmPassName,
                    controller: comfirmPasswordController,
                    validator: (value) {
                      return Validator.validateConfirmPassword(
                        value,
                        passwordController.text,
                      );
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextFormField(
                    hintText: appLocalizations.phoneName,
                    controller: phoneController,
                    validator: (value) {
                      return Validator.phoneValidator(value);
                    },
                    prefixIconName: AppImages.phoneIcon,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    onTap: onTap,
                    child: Text(appLocalizations.createAccount),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.alreadyHaveAccount,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          appLocalizations.login,
                          style: textTheme.labelLarge!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ChangeLanguageWidget(context.watch()),
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
