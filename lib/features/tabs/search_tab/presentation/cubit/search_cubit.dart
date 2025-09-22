import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tabs/search_tab/data/model/movie.dart';
import 'package:movie_app/features/tabs/search_tab/data/repository/search_tab_repository.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInit());

  final SearchTabRepository _repository = SearchTabRepository();
  final List<Movie> _moviesList = [];
  int _pageNum = 1;
  bool hasMore = true;

  Future<void> search(String? query) async {
    _moviesList.clear();
    _pageNum = 1;
    hasMore = true;
    emit(SearchLoading());

    final response = await _repository.search(query, _pageNum);

    response.fold(
      (exception) {
        emit(SearchError(exception.message));
      },
      (data) {
        final newMovies = data.data?.movies ?? [];
        _moviesList.addAll(newMovies);
        if (newMovies.length < 20) hasMore = false;
        _pageNum++;
        emit(SearchSuccess(moviesList: _moviesList, isPaginating: false));
      },
    );
  }

  Future<void> loadMoreMovies(String? query) async {
    if (!hasMore) return;
    emit(SearchSuccess(moviesList: _moviesList, isPaginating: true));

    final response = await _repository.search(query, _pageNum);
    response.fold(
      (exception) {
        emit(SearchError(exception.message));
      },
      (data) {
        final newMovies = data.data?.movies ?? [];
        _moviesList.addAll(newMovies);
        if (newMovies.length < 20) hasMore = false;
        _pageNum++;
        emit(SearchSuccess(moviesList: _moviesList, isPaginating: false));
      },
    );
  }
}
