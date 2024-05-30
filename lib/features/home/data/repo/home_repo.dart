import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:movizone/core/unified_api/failures.dart';
import 'package:movizone/core/unified_api/handling_exception_manager.dart';
import 'package:movizone/features/home/data/datasource/details_datasource.dart';
import 'package:movizone/features/home/data/datasource/home_datasource.dart';
import 'package:movizone/features/home/data/model/genres_response_model.dart';
import 'package:movizone/features/home/data/model/movie_details_model.dart';
import 'package:movizone/features/home/data/model/reviews_model.dart';
import 'package:movizone/features/home/data/model/top_rated_model.dart';

import '../model/credits_model.dart';

class HomeRepo with HandlingExceptionManager {
  Future<Either<Failure, GenresResponseModel>> getGenres() async {
    return wrapHandling(tryCall: () async {
      final result = await HomeDataSource().getGenres();
      return Right(result);
    });
  }

  Future<Either<Failure, TopRatedResponseModel>> getTopRated() async {
    return await wrapHandling(tryCall: () async {
      final result = await HomeDataSource().getTopRated();
      return Right(result);
    });
  }

  Future<Either<Failure, TopRatedResponseModel>> getMovies(
      String? genreId) async {
    return await wrapHandling(tryCall: () async {
      final result = await HomeDataSource().getMovies(genreId);
      return Right(result);
    });
  }

  Future<Either<Failure, MovieDetailsResponseModel>> getDetails(
      String movieId) async {
    return await wrapHandling(tryCall: () async {
      final result = await DetailsDataSource().getDetails(movieId);
      return Right(result);
    });
  }

  Future<Either<Failure, MovieReviewsResponseModel>> getReviews(
      String movieId) async {
    return await wrapHandling(tryCall: () async {
      final result = await DetailsDataSource().getReviews(movieId);
      return Right(result);
    });
  }

  Future<Either<Failure, MovieCreditsResponseModel>> getCredits(
      String movieId) async {
    return await wrapHandling(tryCall: () async {
      final result = await DetailsDataSource().getCredits(movieId);
      return Right(result);
    });
  }
}
