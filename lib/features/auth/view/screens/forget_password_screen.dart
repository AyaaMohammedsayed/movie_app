import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/view/widgets/default_elevated_buttom.dart';
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
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DefaultElevatedButton(lable: 'Verify Email', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
