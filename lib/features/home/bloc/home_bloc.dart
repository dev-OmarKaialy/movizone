import 'package:bloc/bloc.dart';
import 'package:movizone/core/unified_api/status.dart';
import 'package:movizone/features/home/data/model/genres_response_model.dart';
import 'package:movizone/features/home/data/model/top_rated_model.dart';
import 'package:movizone/features/home/data/repo/home_repo.dart';

import '../data/model/credits_model.dart';
import '../data/model/movie_details_model.dart';
import '../data/model/reviews_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(categoriesStatus: Status.loading));
      final result = await HomeRepo().getGenres();
      result.fold(
        (l) => emit(state.copyWith(categoriesStatus: Status.failed)),
        (r) => emit(
          state.copyWith(
            categoriesStatus: Status.success,
            genres: r.genres,
          ),
        ),
      );
    });

    on<GetTopRated>((event, emit) async {
      emit(state.copyWith(topRatedStatus: Status.loading));
      final result = await HomeRepo().getTopRated();
      result.fold(
        (l) => emit(state.copyWith(topRatedStatus: Status.failed)),
        (r) => emit(
          state.copyWith(
            topRatedStatus: Status.success,
            topRated: r.results?.sublist(0, 5),
          ),
        ),
      );
    });
    on<GetMoviesEvent>((event, emit) async {
      emit(state.copyWith(moviesStatus: Status.loading));
      final result = await HomeRepo().getMovies(event.genreId);
      result.fold(
        (l) => emit(state.copyWith(moviesStatus: Status.failed)),
        (r) => emit(
          state.copyWith(
            moviesStatus: Status.success,
            movies: r.results,
          ),
        ),
      );
    });
    on<GetDetailsEvent>((event, emit) async {
      emit(state.copyWith(
          detailsStatus: Status.loading,
          reviewsStatus: Status.initial,
          creditsStatus: Status.initial));
      final result = await HomeRepo().getDetails(event.movieId);
      result.fold(
        (l) => emit(state.copyWith(detailsStatus: Status.failed)),
        (r) {
          emit(
            state.copyWith(detailsStatus: Status.success, movieDetails: r),
          );
          add(GetReviewsEvent(movieId: event.movieId));
          add(GetCreditsEvent(movieId: event.movieId));
        },
      );
    });
    on<GetReviewsEvent>((event, emit) async {
      emit(state.copyWith(reviewsStatus: Status.loading));
      final result = await HomeRepo().getReviews(event.movieId);
      result.fold(
        (l) => emit(state.copyWith(reviewsStatus: Status.failed)),
        (r) => emit(
          state.copyWith(reviewsStatus: Status.success, reviews: r.results),
        ),
      );
    });
    on<GetCreditsEvent>((event, emit) async {
      emit(state.copyWith(creditsStatus: Status.loading));
      final result = await HomeRepo().getCredits(event.movieId);
      result.fold(
        (l) => emit(state.copyWith(creditsStatus: Status.failed)),
        (r) => emit(
          state.copyWith(creditsStatus: Status.success, cast: r.cast),
        ),
      );
    });
  }
}
