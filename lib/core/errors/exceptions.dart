abstract class AppException implements Exception {
  final String message;

  AppException(this.message);
}

class MovieDetailsException extends AppException {
  MovieDetailsException(super.message);
}

class MovieSuggestionsException extends AppException {
  MovieSuggestionsException(super.message);
}
