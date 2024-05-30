part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetTopRated extends HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetMoviesEvent extends HomeEvent {
  final String? genreId;
  GetMoviesEvent({
    this.genreId,
  });
}

class GetDetailsEvent extends HomeEvent {
  final String movieId;
  GetDetailsEvent({
    required this.movieId,
  });
}

class GetReviewsEvent extends HomeEvent {
  final String movieId;
  GetReviewsEvent({
    required this.movieId,
  });
}

class GetCreditsEvent extends HomeEvent {
  final String movieId;
  GetCreditsEvent({
    required this.movieId,
  });
}
