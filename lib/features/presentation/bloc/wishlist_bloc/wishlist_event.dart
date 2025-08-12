part of 'wishlist_bloc.dart';

class WishlistEvent {
  const WishlistEvent();
}

class GetWishlistEvent extends WishlistEvent {}

class AddToWishlistEvent extends WishlistEvent {
  final String id;

  AddToWishlistEvent({required this.id});
}

class RemoveFromWishlistEvent extends WishlistEvent {
  final String id;

  RemoveFromWishlistEvent({required this.id});
}
