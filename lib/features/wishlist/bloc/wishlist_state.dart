part of 'wishlist_bloc.dart';

class WishlistState {
  final Status wishlistStatus;
  final List<MovieDetailsResponseModel> wishlistMovies;
  WishlistState({
    this.wishlistStatus = Status.initial,
    this.wishlistMovies = const [],
  });

  WishlistState copyWith({
    Status? wishlistStatus,
    List<MovieDetailsResponseModel>? wishlistMovies,
  }) {
    return WishlistState(
      wishlistStatus: wishlistStatus ?? this.wishlistStatus,
      wishlistMovies: wishlistMovies ?? this.wishlistMovies,
    );
  }
}
