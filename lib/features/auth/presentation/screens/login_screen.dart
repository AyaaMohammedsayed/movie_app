import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/constants.dart';

import 'package:movie_app/core/languages/view_model/languages_view_model.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/languages/view/change_language.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/cubit/states.dart';
import 'package:movie_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:movie_app/features/auth/presentation/screens/register_screen.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/screens/update_profile.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AppLocalizations appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
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
                    hintText: appLocalizations.mailName,
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                    prefixIconName: AppImages.mailIcon,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomTextFormField(
                    hintText: appLocalizations.passName,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.validatePassword(value);
                    },
                    prefixIconName: AppImages.passIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.004),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ForgetPasswordScreen.routeName,
                        );
                      },
                      child: Text(
                        appLocalizations.forgetPass,
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

                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        UiUtils.showLoading(context);
                      } else if (state is LoginSuccess) {
                        UiUtils.hideLoading(context);
                        UiUtils.showSuccessMessage(
                          state.loginResponse.message!,
                        );
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(UpdateProfile.routeName);
                      } else if (state is LoginError) {
                        UiUtils.hideLoading(context);
                        UiUtils.showErrorMessage(state.message);
                      }
                    },
                    child: CustomElevatedButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                      child: Text(appLocalizations.login),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.dntHaveAccount,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                        child: Text(
                          appLocalizations.createOne,
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
                        appLocalizations.or,
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
                          appLocalizations.googleLogin,
                          style: textTheme.labelSmall!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      //code
                    },
                  ),

                  SizedBox(height: screenHeight * 0.02),
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
