import 'package:dartz/dartz.dart';
import 'package:movizone/core/unified_api/handling_exception_manager.dart';
import 'package:movizone/features/search/data/datasource/search_datasource.dart';
import 'package:movizone/features/search/data/models/search_model.dart';

import '../../../../core/unified_api/failures.dart';

class SearchRepo with HandlingExceptionManager {
  Future<Either<Failure, SearchResponseModel>> searchMovie(
      Map<String, String> params) async {
    return wrapHandling(tryCall: () async {
      final result = await SearchDatasource().searchMovie(params);
      return Right(result);
    });
  }
}
