import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static List<OnboardingModel> onboardingList = List.generate(
    6,
    (index) => getItem(index),
  );

  static List<String> images = ['0', '1', '2', '3', '4', '5'];

  static List<String> titles = [
    'Find Your Next Favorite Movie Here',
    'Discover Movies',
    'Explore All Genres',
    'Create Watchlists',
    'Rate, Review, and Learn',
    'Start Watching Now',
  ];

  static List<String> desc = [
    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    "",
  ];

  static OnboardingModel getItem(int index) {
    return OnboardingModel(
      imgName: images[index],
      title: titles[index],
      description: desc[index],
    );
  }

  static void onboardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CacheKey.onBoarding, true);
  }
}
