import 'package:bloc/bloc.dart';
import 'package:movizone/core/unified_api/status.dart';
import 'package:movizone/features/home/data/model/genres_response_model.dart';
import 'package:movizone/features/home/data/model/top_rated_model.dart';
import 'package:movizone/features/home/data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetCategoriesEvent>((event, emit) async {
      print(event);
      emit(state.copyWith(categoriesStatus: Status.loading));
      final result = await HomeRepo().getGenres();
      print(event);
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
      print(event);
      emit(state.copyWith(topRatedStatus: Status.loading));
      final result = await HomeRepo().getTopRated();
      print(event);
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
      print(event);
      emit(state.copyWith(moviesStatus: Status.loading));
      final result = await HomeRepo().getMovies(event.genreId);
      print(event);
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
  }
}
