import 'package:movizone/core/unified_api/api_variables.dart';

import '../../../../core/unified_api/get_api.dart';
import '../models/search_model.dart';

class SearchDatasource {
  Future<SearchResponseModel> searchMovie(Map<String, String> params) async {
    final result = GetApi(
        uri: ApiVariables().search(params),
        fromJson: searchResponseModelFromJson);
    return await result.callRequest();
  }
}
