<<<<<<< HEAD
import 'package:movie_app/core/languages/data/data_source/local/language_data_source.dart';
=======
import 'package:movie_app/core/languages/data/data_source/language_data_source.dart';
>>>>>>> 88daba2a7eca5ca477dad6c69e67ffc69aff99d1
import 'package:movie_app/core/languages/data/data_source/local/language_shared_prefs_data_source.dart';

class ServiceLocator {
  static LanguageDataSource languageRepository =
      LanguageSharedPrefsDataSource();
}
