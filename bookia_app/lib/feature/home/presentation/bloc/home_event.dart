class HomeEvent {}

class GetBestSellersEvent extends HomeEvent {}

class GetSlidersEvent extends HomeEvent {}

// wishlist

class GetWishlistEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;
  AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int productId;
  RemoveFromWishlistEvent(this.productId);
}
