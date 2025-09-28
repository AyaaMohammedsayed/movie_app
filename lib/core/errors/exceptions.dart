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

class MovieListsException extends AppException {
  MovieListsException(super.message);
}

class RegisterException extends AppException {
  RegisterException(super.message);
}

class LoginException extends AppException {
  LoginException(super.message);
}

class LoginWithGoogleException extends AppException {
  LoginWithGoogleException(super.message);
}

class SearchException extends AppException {
  SearchException(super.message);
}

class BrowseException extends AppException {
  BrowseException(super.message);
}

class UpdateProfileException extends AppException {
  UpdateProfileException(super.message);
}

class DeleteProfileException extends AppException {
  DeleteProfileException(super.message);
}

class ResetPasswordException extends AppException {
  ResetPasswordException(super.message);
}

class GetProfileException extends AppException {
  GetProfileException(super.message);
}

class GetWishListException extends AppException {
  GetWishListException(super.message);
}

class CheckIsFavWishListException extends AppException {
  CheckIsFavWishListException(super.message);
}

class AddToWishListException extends AppException {
  AddToWishListException(super.message);
}

class DeleteFromWishListException extends AppException {
  DeleteFromWishListException(super.message);
}
