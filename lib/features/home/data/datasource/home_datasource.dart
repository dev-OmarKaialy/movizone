import 'package:movizone/core/unified_api/api_variables.dart';
import 'package:movizone/core/unified_api/get_api.dart';

import '../model/genres_response_model.dart';
import '../model/top_rated_model.dart';

class HomeDataSource {
  Future<GenresResponseModel> getGenres() async {
    final result = GetApi(
        uri: ApiVariables().getCategories(),
        fromJson: genresResponseModelFromJson);

    var callRequest = await result.callRequest();
    return callRequest;
  }

  Future<TopRatedResponseModel> getTopRated() async {
    final result = GetApi(
        uri: ApiVariables().getPopular(),
        fromJson: topRatedResponseModelFromJson);
    return await result.callRequest();
  }

  Future<TopRatedResponseModel> getMovies(String? genreId) async {
    final result = GetApi(
        uri: ApiVariables()
            .getMovie(genreId == null ? {} : {'with_genres': genreId}),
        fromJson: topRatedResponseModelFromJson);
    return await result.callRequest();
  }
}
