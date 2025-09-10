import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/languages/view_model/settings_provider.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/languages/view/change_language.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/features/auth/data/models/login_requeest.dart';
import 'package:movie_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/view/screens/register_screen.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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

  void onTap() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        LoginRequeest(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      UiUtils.showSuccessMessage(appLocalizations.loginSuccess);
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    } else {
      UiUtils.showErrorMessage(appLocalizations.loginFailed);
    }
  }

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
                      onPressed: () {},
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
                  CustomElevatedButton(
                    onTap: onTap,
                    child: Text(AppLocalizations.of(context)!.login),
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
                          Navigator.of(
                            context,
                          ).pushNamed(RegisterScreen.routeName);
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
                    onTap: () {},
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
