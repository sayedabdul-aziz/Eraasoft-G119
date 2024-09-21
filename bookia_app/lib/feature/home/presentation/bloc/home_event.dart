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

// cart

class GetCartEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;
  AddToCartEvent({required this.productId});
}

class UpdateCartEvent extends HomeEvent {
  final int cartItemId;
  final int quantity;

  UpdateCartEvent({required this.cartItemId, required this.quantity});
}

class RemoveFromCartEvent extends HomeEvent {
  final int cartItemId;
  RemoveFromCartEvent(this.cartItemId);
}
