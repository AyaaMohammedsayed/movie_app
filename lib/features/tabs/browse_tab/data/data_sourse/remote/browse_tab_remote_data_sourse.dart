import 'package:movie_app/features/tabs/browse_tab/data/model/browse_response.dart';

abstract class BrowseTabRemoteDataSourse {
  Future<BrowseResponse> getMoviesByCategory(
    String? categoryId,
    int pageNumber,
  );
}
