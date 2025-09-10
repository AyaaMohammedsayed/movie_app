import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/languages/view_model/language_state.dart';
<<<<<<< HEAD
import 'package:movie_app/core/languages/view_model/languages_view_model.dart';
=======
import 'package:movie_app/core/languages/view_model/settings_provider.dart';
>>>>>>> 88daba2a7eca5ca477dad6c69e67ffc69aff99d1
import 'package:movie_app/core/utils/localize_app_localization.dart';
import 'package:movie_app/features/auth/view/screens/forget_password_screen.dart';
import 'package:movie_app/features/auth/view/screens/login_screen.dart';
import 'package:movie_app/features/auth/view/screens/register_screen.dart';
import 'package:movie_app/features/home_screen/view/screens/home_screen.dart';
import 'package:movie_app/features/onboarding/view/onboarding.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/update_profile.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );
  runApp(
    BlocProvider(
      create: (_) => LanguagesViewModel()..changeLanguage("en"),
      child: MovieApp(),
    ),
  );
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesViewModel, LanguageState>(
      builder: (_, state) {
        if (state is LanguageLoading) {
          return const Directionality(
            textDirection: TextDirection.ltr, // Provide a directionality
            child: Center(
              child: CircularProgressIndicator(),
            ), // Wrap in a center widget
          );
        } else if (state is LanguageError) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Text(state.message),
          );
        } else if (state is LanguageSuccess) {
          return ScreenUtilInit(
            designSize: Size(430, 932),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  Onboarding.routeName: (_) => Onboarding(),
                  LoginScreen.routeName: (_) => LoginScreen(),
                  UpdateProfile.routeName: (_) => UpdateProfile(),
                  ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
                  HomeScreen.routeName: (_) => HomeScreen(),
                },
                initialRoute: LoginScreen.routeName,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.dark,
                onGenerateTitle: (context) {
                  AppDependencies().localizations =
                      AppLocalizations.of(context)!;
                  return AppDependencies().localizations.login;
                },
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(state.languageCode),
              );
            },
          );
        } else {
          return const Directionality(
            textDirection: TextDirection.ltr,
            child: Text('Initial State'), // Fallback widget with directionality
          );
        }
      },
    );
  }
}
