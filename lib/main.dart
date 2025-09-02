import 'package:flutter/material.dart';
import 'package:movie_app/auth/forget_password_screen.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgetpasswordScreen(),
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
