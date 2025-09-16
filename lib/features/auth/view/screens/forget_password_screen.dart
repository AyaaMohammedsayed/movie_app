import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPassword';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(appLocalizations.forgetPass)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.forgetPassImg,
                height: MediaQuery.sizeOf(context).height * 0.42,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: appLocalizations.mailName,
                controller: emailController,
                prefixIconName: AppImages.mailIcon,
                validator: (value) {
                  return Validator.validateEmail(value);
                },
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                child: Text(appLocalizations.verifyEmail),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
