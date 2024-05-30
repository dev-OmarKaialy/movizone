part of 'search_bloc.dart';

class SearchState {
  final Status status;
  final List<MovieSearchModel> searchResults;
  SearchState({
    this.status = Status.initial,
    this.searchResults = const [],
  });

  SearchState copyWith({
    Status? status,
    List<MovieSearchModel>? searchResults,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
