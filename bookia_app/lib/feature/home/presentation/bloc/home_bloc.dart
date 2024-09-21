import 'package:bookia_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_banner_response_model/get_banner_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/feature/home/data/repo/home_repo.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetBestSellersEvent>(getBestSeller);
    on<GetSlidersEvent>(getSliders);
    on<AddToWishlistEvent>(addToWishlist);
    on<GetWishlistEvent>(getWishlist);
    on<RemoveFromWishlistEvent>(deleteFromWishlist);
    on<GetCartEvent>(getCart);
    on<AddToCartEvent>(addToCart);
    on<UpdateCartEvent>(updateCartItem);
    on<RemoveFromCartEvent>(deleteFromCart);
  }
  late BestSellerResponseModel bestSellerResponseModel;
  late GetSlidersResponseModel getSlidersResponseModel;
  late GetWishlistResponseModel getWishlistResponseModel;
  late GetCartResponseModel getCartResponseModel;

  Future<void> getSliders(
      GetSlidersEvent event, Emitter<HomeState> emit) async {
    emit(GetSlidersLoadingState());
    await HomeRepo.getSliders().then((value) {
      if (value != null) {
        getSlidersResponseModel = value;
        emit(GetSlidersSuccessState());
      } else {
        emit(HomeErrorState("Get Best Seller Failed"));
      }
    });
  }

  Future<void> getBestSeller(
      GetBestSellersEvent event, Emitter<HomeState> emit) async {
    emit(GetBestSellersLoadingState());
    await HomeRepo.getBestSeller().then((value) {
      if (value != null) {
        bestSellerResponseModel = value;
        emit(GetBestSellersSuccessState(value));
      } else {
        emit(HomeErrorState("Get Best Seller Failed"));
      }
    });
  }

  Future<void> getWishlist(
      GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());
    await HomeRepo.getWishlist().then((value) {
      if (value != null) {
        if (value.data?.data?.isEmpty == true) {
          emit(GetWishlistEmptyState());
        } else {
          getWishlistResponseModel = value;
          emit(GetWishlistLoadedState());
        }
      } else {
        emit(HomeErrorState("Get Wishlist Failed"));
      }
    });
  }

  Future<void> addToWishlist(
      AddToWishlistEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());
    await HomeRepo.addToWishlist(productId: event.productId).then((value) {
      if (value) {
        emit(AddToWishlistLoadedState());
      } else {
        emit(HomeErrorState("Add To Wishlist Failed"));
      }
    });
  }

  Future<void> deleteFromWishlist(
      RemoveFromWishlistEvent event, Emitter<HomeState> emit) async {
    emit(DeleteFromWishlistLoadingState());
    await HomeRepo.deleteToWishlist(productId: event.productId).then((value) {
      if (value) {
        emit(DeleteFromWishlistLoadedState());
      } else {
        emit(HomeErrorState("Delete To Wishlist Failed"));
      }
    });
  }

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());
    await HomeRepo.getCart().then((value) {
      if (value != null) {
        if (value.data?.cartItems?.isEmpty == true) {
          emit(GetCartEmptyState());
        } else {
          getCartResponseModel = value;
          emit(GetCartLoadedState());
        }
      } else {
        emit(HomeErrorState("Get Wishlist Failed"));
      }
    });
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());
    await HomeRepo.addToCart(productId: event.productId).then((value) {
      if (value) {
        emit(AddToCartLoadedState());
      } else {
        emit(HomeErrorState("Add To Wishlist Failed"));
      }
    });
  }

  Future<void> updateCartItem(
      UpdateCartEvent event, Emitter<HomeState> emit) async {
    emit(UpdateCartLoadingState());
    await HomeRepo.updateCartItem(
            cartItemId: event.cartItemId, quantity: event.quantity)
        .then((value) {
      if (value) {
        emit(UpdateCartLoadedState());
      } else {
        emit(HomeErrorState("Add To Wishlist Failed"));
      }
    });
  }

  Future<void> deleteFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(DeleteFromCartLoadingState());
    await HomeRepo.deleteFromCart(cartItemId: event.cartItemId).then((value) {
      if (value) {
        emit(DeleteFromCartLoadedState());
      } else {
        emit(HomeErrorState("Delete To Wishlist Failed"));
      }
    });
  }
}
