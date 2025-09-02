import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/auth/view/screens/login_screen.dart';
import 'package:movie_app/onboarding/view/onboarding.dart';
import 'package:movie_app/profile/presentation/update_profile.dart';
import 'package:movie_app/core/app_theme.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            Onboarding.routeName: (_) => Onboarding(),
            LoginScreen.routName: (_) => LoginScreen(),
            UpdateProfile.routeName: (_) => UpdateProfile(),
          },
          initialRoute: LoginScreen.routName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
