import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/movie_b.dart';
import 'package:movie_app/features/tabs/browse_tab/data/repository/browse_tab_repository.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_state.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/movie_category.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInit());

  final BrowseTabRepository _repository = BrowseTabRepository();

  String _currentCategoryId = '';
  int _currentPageNum = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  List<MovieCategory> _categories = [];
  final List<MovieB> _currentMovies = [];

  Future<void> getGenresAndMovies() async {
    emit(BrowseLoading());

    final response = await _repository.getGenres();

    response.fold(
      (exception) {
        emit(BrowseError(exception.message));
      },
      (data) {
        _categories =
            data.data?.genres
                ?.map(
                  (genre) => MovieCategory(
                    name: genre.name ?? '',
                    id: genre.id?.toString() ?? '',
                    isSelected: false,
                  ),
                )
                .toList() ??
            [];

        if (_categories.isNotEmpty) {
          _categories[0] = _categories[0].copyWith(isSelected: true);
          getMoviesForCategory(_categories.first.id);
        } else {
          emit(
            BrowseSuccess(
              categories: _categories,
              moviesList: [],
              categoryId: '',
            ),
          );
        }
      },
    );
  }

  Future<void> getMoviesForCategory(String categoryId) async {
    _currentMovies.clear();
    _currentPageNum = 1;
    hasMore = true;
    _currentCategoryId = categoryId;

    emit(BrowseLoading());

    final response = await _repository.getMovies(
      _currentCategoryId,
      _currentPageNum,
    );

    response.fold(
      (exception) {
        emit(BrowseError(exception.message));
      },
      (data) {
        final newMovies = data.data?.movies ?? [];
        _currentMovies.addAll(newMovies);

        if (newMovies.length < 20) hasMore = false;
        _currentPageNum++;
        _categories =
            _categories.map((category) {
              return category.copyWith(isSelected: category.id == categoryId);
            }).toList();

        emit(
          BrowseSuccess(
            categories: _categories,
            moviesList: _currentMovies,
            categoryId: _currentCategoryId,
          ),
        );
      },
    );
  }

  Future<void> loadMoreMoviesForCategory() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final response = await _repository.getMovies(
      _currentCategoryId,
      _currentPageNum,
    );

    response.fold(
      (exception) {
        isLoadingMore = false;
        emit(BrowseError(exception.message));
      },
      (data) {
        final newMovies = data.data?.movies ?? [];
        _currentMovies.addAll(newMovies);

        if (newMovies.length < 20) hasMore = false;
        _currentPageNum++;
        isLoadingMore = false;

        emit(
          BrowseSuccess(
            categories: _categories,
            moviesList: List.from(_currentMovies),
            categoryId: _currentCategoryId,
          ),
        );
      },
    );
  }
}