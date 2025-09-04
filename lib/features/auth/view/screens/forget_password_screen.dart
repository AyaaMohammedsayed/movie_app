import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPassword';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(AppTexts.forgetPass)),
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
                hintText: AppTexts.mailName,
                controller: emailController,
                prefixIconName: AppImages.mailIcon,
                validator: (value) {
                  return Validator.emailValidator(value);
                },
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                child: Text(AppTexts.verifyEmail),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
