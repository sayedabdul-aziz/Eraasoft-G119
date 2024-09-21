import 'package:bookia_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

// Get Sliders
class GetSlidersLoadingState extends HomeState {}

class GetSlidersSuccessState extends HomeState {}

// Get Best Seller
class GetBestSellersLoadingState extends HomeState {}

class GetBestSellersSuccessState extends HomeState {
  BestSellerResponseModel bestSellerResponseModel;
  GetBestSellersSuccessState(this.bestSellerResponseModel);
}

// wishlist

class GetWishlistLoadingState extends HomeState {}

class GetWishlistLoadedState extends HomeState {}

class GetWishlistEmptyState extends HomeState {}

class AddToWishlistLoadingState extends HomeState {}

class AddToWishlistLoadedState extends HomeState {}

class DeleteFromWishlistLoadingState extends HomeState {}

class DeleteFromWishlistLoadedState extends HomeState {}

// wishlist

class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

class GetCartEmptyState extends HomeState {}

class AddToCartLoadingState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

class UpdateCartLoadingState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class DeleteFromCartLoadingState extends HomeState {}

class DeleteFromCartLoadedState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}
