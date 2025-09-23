import 'package:equatable/equatable.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/movie_b.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/movie_category.dart';

abstract class BrowseState extends Equatable {
  const BrowseState();

  @override
  List<Object?> get props => [];
}

class BrowseInit extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseError extends BrowseState {
  final String message;
  const BrowseError(this.message);

  @override
  List<Object?> get props => [message];
}

class BrowseSuccess extends BrowseState {
  final List<MovieB> moviesList;
  final bool isPaginating;
  final String categoryId;
  final List<MovieCategory> categories;

  const BrowseSuccess({
    required this.moviesList,
    required this.categoryId,
    this.isPaginating = false,
   required this.categories
  });

  @override
  List<Object?> get props => [moviesList, categoryId, isPaginating,categories];
}
