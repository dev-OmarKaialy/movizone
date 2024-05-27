class ApiVariables {
  final _scheme = 'https';
  final _host = 'api.themoviedb.org';

  final port = 8000;
  final imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  Uri _mainUri(String path, {Map<String, String>? params}) {
    return Uri(
      host: _host,
      scheme: _scheme,
      path: path,
      queryParameters: {'api_key': ''}..addAll(params ?? {}),
    );
  }

  Uri getPopular() => _mainUri('/3/movie/popular');
  Uri getCategories() => _mainUri('/3/genre/movie/list');
  Uri getMovie(Map<String, String> params) =>
      _mainUri('/3/discover/movie', params: params);
}
