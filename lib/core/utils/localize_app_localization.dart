import 'package:movie_app/l10n/app_localizations.dart';

class AppDependencies {
  static final AppDependencies _instance = AppDependencies._internal();
  factory AppDependencies() => _instance;
  AppDependencies._internal();

  late AppLocalizations localizations;
}
