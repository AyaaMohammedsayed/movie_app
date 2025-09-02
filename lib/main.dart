import 'package:flutter/material.dart';
import 'package:movie_app/onboarding/view/onboarding.dart';

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
        Onboarding.routeName:(_)=> Onboarding()
      },
      initialRoute: Onboarding.routeName,
      darkTheme: ThemeData.dark(),
      themeMode:ThemeMode.dark,



    );
  }
}
