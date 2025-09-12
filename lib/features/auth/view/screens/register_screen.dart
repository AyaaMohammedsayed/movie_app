import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/languages/view/change_language.dart';
import 'package:movie_app/core/languages/view_model/languages_view_model.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/features/auth/view/screens/login_screen.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register_screen';

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AppLocalizations appLocalizations;
  int currentIndex = 0;

  void onTap() {
    if (formKey.currentState!.validate()) {
      UiUtils.showSuccessMessage(appLocalizations.registerSuccess);
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 150.h,
                      viewportFraction: 0.4,
                      initialPage: currentIndex,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, _) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    itemCount: AppImages.avatarList.length,
                    itemBuilder: (_, index, _) {
                      return Image.asset(
                        AppImages.avatarList[index],

                        fit: BoxFit.fill,
                      );
                    },
                  ),
                  Text(
                    appLocalizations.pickAvatar,
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: appLocalizations.userName,
                    controller: nameController,
                    validator: (value) {
                      return Validator.nameValidator(value);
                    },
                    prefixIconName: AppImages.nameIcon,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: appLocalizations.mailName,
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                    prefixIconName: AppImages.mailIcon,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: appLocalizations.passName,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.validatePassword(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: appLocalizations.restPass,
                    controller: confirmPasswordController,
                    validator: (value) {
                      return Validator.validateConfirmPassword(
                        value,
                        passwordController.text,
                      );
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: appLocalizations.phoneName,
                    controller: phoneController,
                    validator: (value) {
                      return Validator.phoneValidator(value);
                    },
                    prefixIconName: AppImages.phoneIcon,
                  ),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onTap: onTap,
                    child: Text(appLocalizations.register),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.alreadyHaveOne,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
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
                  SizedBox(height: 10.h),
                  ChangeLanguageWidget(context.watch<LanguagesViewModel>()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
