

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tabs/home_tab/data/repository/movie_repository.dart';
import 'package:movie_app/features/tabs/home_tab/presentation/cubit/states.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;
  MovieCubit(this.repository) : super(MovieInit());
 String selectedCategory = 'Action';
  void getMovieList({String? genre}) async {
    emit(GetMovieLoading());
    final result = await repository.getMovieList();
    result.fold(
      (failure) => emit(GetMovieError(failure.message)),
      (movieResponse) => emit(GetMovieSuccess(movieResponse)),
    );
  }
  
  void setCategory(String category) {
    selectedCategory = category;
    getMovieList(genre: category);
  }
}

