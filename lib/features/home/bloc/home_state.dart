part of 'home_bloc.dart';

class HomeState {
  final List<MovieModel> topRated;
  final List<MovieModel> movies;
  final List<GenreModel> genres;
  final List<Cast> cast;
  final List<ReviewModel> reviews;
  final MovieDetailsResponseModel? movieDetails;
  final Status creditsStatus;
  final Status reviewsStatus;
  final Status detailsStatus;
  final Status topRatedStatus;
  final Status categoriesStatus;
  final Status moviesStatus;
  HomeState({
    this.topRated = const [],
    this.movies = const [],
    this.genres = const [],
    this.cast = const [],
    this.reviews = const [],
    this.movieDetails,
    this.creditsStatus = Status.initial,
    this.reviewsStatus = Status.initial,
    this.detailsStatus = Status.initial,
    this.topRatedStatus = Status.initial,
    this.categoriesStatus = Status.initial,
    this.moviesStatus = Status.initial,
  });

  HomeState copyWith({
    List<MovieModel>? topRated,
    List<MovieModel>? movies,
    List<GenreModel>? genres,
    List<Cast>? cast,
    List<ReviewModel>? reviews,
    MovieDetailsResponseModel? movieDetails,
    Status? creditsStatus,
    Status? reviewsStatus,
    Status? detailsStatus,
    Status? topRatedStatus,
    Status? categoriesStatus,
    Status? moviesStatus,
  }) {
    return HomeState(
      topRated: topRated ?? this.topRated,
      movies: movies ?? this.movies,
      genres: genres ?? this.genres,
      cast: cast ?? this.cast,
      reviews: reviews ?? this.reviews,
      movieDetails: movieDetails ?? this.movieDetails,
      creditsStatus: creditsStatus ?? this.creditsStatus,
      reviewsStatus: reviewsStatus ?? this.reviewsStatus,
      detailsStatus: detailsStatus ?? this.detailsStatus,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      moviesStatus: moviesStatus ?? this.moviesStatus,
    );
  }
}
