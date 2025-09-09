import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/languages/data/repository/language_repository.dart';
import 'package:movie_app/core/languages/view_model/language_state.dart';
import 'package:movie_app/core/service_locator.dart';

class LanguagesViewModel extends Cubit<LanguageState> {
  late LanguageRepository languageRepository;
  LanguagesViewModel() : super(LanguageInit()) {
    languageRepository = LanguageRepository(ServiceLocator.languageRepository);
  }

  String? languageCode;

  void changeLanguage(String language) async {
    emit(LanguageLoading());
    try {
      await languageRepository.setLanguageCode("LanguageCode", language);

      languageCode = await languageRepository.getLanguageCode("LanguageCode");

      emit(LanguageSuccess(languageCode!));
    } catch (error) {
      emit(LanguageError(error.toString()));
    }
  }
}
