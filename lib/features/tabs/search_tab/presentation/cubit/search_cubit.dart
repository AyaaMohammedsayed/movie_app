import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tabs/search_tab/data/model/movie.dart';
import 'package:movie_app/features/tabs/search_tab/data/repository/search_tab_repository.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInit());

  final SearchTabRepository _repository = SearchTabRepository();
  int pageNum = 1;
  bool hasMore = true;
  List<Movie>? moviesList = [];
  bool isLoading = false;

  Future<void> search(String? query, {bool loadMore = false}) async {
    isLoading = true;
    if (loadMore) {
      if (!hasMore) return;
    } else {
      pageNum = 1;
      hasMore = true;
      moviesList = [];
      emit(SearchLoading());
    }
    final response = await _repository.search(query, pageNum);

    response.fold(
      (exception) {
        emit(SearchError(exception.message));
      },
      (data) {
        final newMovies = data.data?.movies;
        if (newMovies == null || newMovies.isEmpty) {
          hasMore = false;
        } else {
          moviesList?.addAll(newMovies);
          pageNum++;
        }

        emit(SearchSuccess(moviesList));
      },
    );
    isLoading = false;
  }
}
