import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_request.dart';
import 'package:movie_app/features/details_screen/data/repository/movie_details_repository.dart';
import 'package:movie_app/features/details_screen/presentation/cubit/movie_datails_states.dart';

class DetailsCubit extends Cubit<MovieDetailsState> {
  DetailsCubit(this.movieId) : super(MovieDetailsInit()) {
    getMovieDetails();
    getMovieSuggestions();
  }

  final MovieDetailsRepository _repository = MovieDetailsRepository();

  String movieId;
  Future<void> getMovieDetails() async {
    emit(MovieDetailsLoading());
    final result = await _repository.getMovieDetails(
      MovieDetailsRequest(
        movieId: movieId,
        withImages: "true",
        withCast: "true",
      ),
    );
    result.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (data) => emit(MovieDetailsSuccess(dData: data)),
    );
  }

  Future<void> getMovieSuggestions() async {
    final result = await _repository.getSuggestion(movieId);
    result.fold((failure) => emit(MovieDetailsError(failure.message)), (
      suggestion,
    ) {
      final currentState = state;
      if (currentState is MovieDetailsSuccess) {
        emit(currentState.copyWith(suggestions: suggestion.movies));
      }
    });
  }
}
