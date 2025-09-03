import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/features/auth/view/widgets/default_text_from_field.dart';

class ForgetpasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPassword';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Forget Password')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/forgetPassword.png',
                height: MediaQuery.sizeOf(context).height * 0.42,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 16),
              DefaultTextFormField(
                hintText: 'Email',
                controller: emailController,
                prefixIconImageName: 'mail_icon',
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
