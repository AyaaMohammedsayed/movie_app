class ConstantAPI {
  static const String baseUrl = "https://yts.mx/api/v2/";
  static const String movieDetailsEndPoint = "movie_details.json";
  static const String movieSuggestionsEndPoint = "movie_suggestions.json";
  static const String movieListEndPoint = "list_movies.json";

  static const String authBaseUrl = "https://route-movie-apis.vercel.app/";
  static const String registerEndPoint = "auth/register";

  static const String loginEndPoint = "auth/login";
  static const String updateProfileEndPoint = "profile";
  static const String resetPasswordEndPoint = "auth/reset-password";
  static const String addToWishListEndPoint = "favorites/add";
  static const String getAllWishListEndPoint = "favorites/all";
  static const String deleteMovieWishListEndPoint = "favorites/remove/";
  static const String isFavMovieEndPoint = "favorites/is-favorite/";
     static const googleDefaultPassword = "1234567***oopP";
}

class CacheKey {
  static const String onBoarding = "onboarding";
}
