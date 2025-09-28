import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/movie_b.dart';
import 'package:movie_app/features/tabs/browse_tab/data/repository/browse_tab_repository.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_state.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/movie_category.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInit());

  final BrowseTabRepository _repository = BrowseTabRepository();

  String _currentCategoryId = "Drama";
  int _currentPageNum = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  List<MovieCategory> _categories = [];
  final Map<String, List<MovieB>> _moviesPerCategory = {};

  Future<void> getGenresAndMovies() async {
    emit(BrowseLoading());

    final response = await _repository.getGenres();

    response.fold(
      (exception) {
        emit(BrowseError(exception.message));
      },
      (data) {
        print(data.data!.genres?[2].id);
        _categories =
            data.data?.genres
                ?.map(
                  (genre) => MovieCategory(
                    name: genre.name ?? '',
                    id: genre.name?.toString() ?? '',
                  ),
                )
                .toList() ??
            [];

        if (_categories.isNotEmpty) {
          print("object:$_currentCategoryId");
          _currentCategoryId = _categories.first.name;
          print(_categories.first);
          print("object:$_currentCategoryId");
        }

        emit(
          BrowseSuccess(
            categories: _categories,
            moviesList: [],
            categoryId: _currentCategoryId,
          ),
        );

        if (_categories.isNotEmpty) {
          getMoviesForCategory(_currentCategoryId);
        }
      },
    );
  }

  Future<void> getMoviesForCategory(String categoryId) async {
    _moviesPerCategory.clear();
    _currentCategoryId = categoryId;
    _currentPageNum = 1;
    hasMore = true;

    if (_moviesPerCategory.containsKey(categoryId) &&
        _moviesPerCategory[categoryId]!.isNotEmpty) {
      emit(
        BrowseSuccess(
          categories: _categories,
          moviesList: _moviesPerCategory[categoryId]!,
          categoryId: categoryId,
        ),
      );
      return;
    }
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
        _moviesPerCategory[categoryId] = newMovies;

        if (newMovies.length < 20) hasMore = false;
        _currentPageNum++;

        emit(
          BrowseSuccess(
            categories: _categories,
            moviesList: _moviesPerCategory[categoryId]!,
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
        final currentList = _moviesPerCategory[_currentCategoryId] ?? [];
        currentList.addAll(newMovies);

        _moviesPerCategory[_currentCategoryId] = currentList;

        if (newMovies.length < 20) hasMore = false;
        _currentPageNum++;
        isLoadingMore = false;

        emit(
          BrowseSuccess(
            categories: _categories,
            moviesList: List.from(currentList),
            categoryId: _currentCategoryId,
          ),
        );
      },
    );
  }
}

