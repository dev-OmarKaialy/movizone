part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class GetWishListEvent extends WishlistEvent {}

class AddWishListEvent extends WishlistEvent {
  final MovieDetailsResponseModel movie;
  AddWishListEvent({
    required this.movie,
  });
}

class RemoveWishListEvent extends WishlistEvent {
  final int id;
  RemoveWishListEvent({
    required this.id,
  });
}
