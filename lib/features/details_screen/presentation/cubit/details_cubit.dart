import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_request.dart';
import 'package:movie_app/features/details_screen/data/repository/movie_details_repository.dart';
import 'package:movie_app/features/details_screen/presentation/cubit/movie_datails_states.dart';

class DetailsCubit extends Cubit<MovieDetailsState> {
  DetailsCubit() : super(MovieDetailsInit());

  final MovieDetailsRepository _repository = MovieDetailsRepository();

  Future<void> getMovieDetails(MovieDetailsRequest request) async {
    emit(MovieDetailsLoading());
    final result = await _repository.getMovieDetails(request);
    result.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (data) => emit(MovieDetailsSuccess(data)),
    );
  }

  Future<void> getMovieSuggestions(String movieID) async {
    final result = await _repository.getSuggestion(movieID);
    result.fold(
      (failure) => emit(MovieSuggestionsError(failure.message)),
      (data) => emit(MovieSuggestionsSuccess(data)),
    );
  }
}
