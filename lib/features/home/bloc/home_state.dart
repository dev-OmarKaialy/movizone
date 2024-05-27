part of 'home_bloc.dart';

class HomeState {
  final List<MovieModel> topRated;
  final List<MovieModel> movies;
  final List<GenreModel> genres;
  final Status topRatedStatus;
  final Status categoriesStatus;
  final Status moviesStatus;
  HomeState({
    this.topRated = const [],
    this.movies = const [],
    this.genres = const [],
    this.topRatedStatus = Status.initial,
    this.categoriesStatus = Status.initial,
    this.moviesStatus = Status.initial,
  });

  HomeState copyWith({
    List<MovieModel>? topRated,
    List<MovieModel>? movies,
    List<GenreModel>? genres,
    Status? topRatedStatus,
    Status? categoriesStatus,
    Status? moviesStatus,
  }) {
    return HomeState(
      topRated: topRated ?? this.topRated,
      movies: movies ?? this.movies,
      genres: genres ?? this.genres,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      moviesStatus: moviesStatus ?? this.moviesStatus,
    );
  }
}
