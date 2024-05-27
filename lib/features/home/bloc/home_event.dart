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
