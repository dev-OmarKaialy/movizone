import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movizone/features/home/data/model/movie_details_model.dart';

import '../../../core/unified_api/status.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState()) {
    on<GetWishListEvent>((event, emit) {
      emit(
        state.copyWith(
          wishlistMovies:
              Hive.box<MovieDetailsResponseModel>('wishlist').values.toList(),
        ),
      );
    });
    on<AddWishListEvent>((event, emit) async {
      await Hive.box<MovieDetailsResponseModel>('wishlist')
          .put(event.movie.id, event.movie);
      add(GetWishListEvent());
    });
    on<RemoveWishListEvent>((event, emit) async {
      await Hive.box<MovieDetailsResponseModel>('wishlist').delete(event.id);
      add(GetWishListEvent());
    });
  }
}
