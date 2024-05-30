import 'package:bloc/bloc.dart';
import 'package:movizone/core/unified_api/status.dart';
import 'package:movizone/features/search/data/repo/search_repo.dart';

import '../data/models/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchMovieEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      final result = await SearchRepo().searchMovie({'query': event.query});
      result.fold(
        (l) => emit(state.copyWith(status: Status.failed)),
        (r) => emit(
          state.copyWith(searchResults: r.results, status: Status.success),
        ),
      );
    });
  }
}
