<<<<<<< HEAD
import 'package:movie_app/core/languages/data/data_source/local/language_data_source.dart';
=======
import 'package:movie_app/core/languages/data/data_source/language_data_source.dart';
>>>>>>> 88daba2a7eca5ca477dad6c69e67ffc69aff99d1

class LanguageRepository {
  final LanguageDataSource languageDataSource;
  const LanguageRepository(this.languageDataSource);

  Future<String?> getLanguageCode(String key) async {
    return languageDataSource.getLanguageCode(key);
  }

  Future<void> setLanguageCode(String key, String code) async {
    languageDataSource.setLanguageCode(key, code);
  }
}
