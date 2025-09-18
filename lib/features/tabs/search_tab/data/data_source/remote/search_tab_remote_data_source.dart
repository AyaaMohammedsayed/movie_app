import 'package:movie_app/features/tabs/search_tab/data/model/search_response.dart';

abstract class SearchTabRemoteDataSource {
  Future<SearchResponse> search(String? query, int pageNumber);
}
