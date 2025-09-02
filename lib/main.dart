import 'package:flutter/material.dart';
import 'package:movie_app/onboarding/view/onboarding.dart';
import 'package:movie_app/profile/update_profile.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Onboarding.routeName:(_)=> Onboarding(),
        UpdateProfile.routeName:(_)=>UpdateProfile()
      },
      initialRoute: UpdateProfile.routeName,
      darkTheme: AppTheme.darkTheme,
      themeMode:ThemeMode.dark,



    );
  }
}
