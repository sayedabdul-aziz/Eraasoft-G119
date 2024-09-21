import 'dart:developer';

import 'package:bookia_app/core/constants/endpoints.dart';
import 'package:bookia_app/core/services/dio/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_banner_response_model/get_banner_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_wishlist_response_model/get_wishlist_response_model.dart';

class HomeRepo {
  static Future<GetSlidersResponseModel?> getSliders() async {
    try {
      var response = await DioProvider.get(endpoint: AppEndpoints.getSliders);
      if (response.statusCode == 200) {
        var model = GetSlidersResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BestSellerResponseModel?> getBestSeller() async {
    try {
      var response =
          await DioProvider.get(endpoint: AppEndpoints.getBestSeller);
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishlist({required int productId}) async {
    try {
      var response =
          await DioProvider.post(endpoint: AppEndpoints.addToWishlist, data: {
        "product_id": productId,
      }, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> deleteToWishlist({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.deleteFromWishlist,
          data: {
            "product_id": productId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetWishlistResponseModel?> getWishlist() async {
    try {
      var response =
          await DioProvider.get(endpoint: AppEndpoints.getWishlist, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 200) {
        var model = GetWishlistResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  // cart
  static Future<bool> addToCart({required int productId}) async {
    try {
      var response =
          await DioProvider.post(endpoint: AppEndpoints.addToCart, data: {
        "product_id": productId,
      }, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> updateCartItem(
      {required int cartItemId, required int quantity}) async {
    try {
      var response =
          await DioProvider.post(endpoint: AppEndpoints.updateCart, data: {
        "cart_item_id": cartItemId,
        "quantity": quantity
      }, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> deleteFromCart({required int cartItemId}) async {
    try {
      var response =
          await DioProvider.post(endpoint: AppEndpoints.deleteFromCart, data: {
        "cart_item_id": cartItemId,
      }, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetCartResponseModel?> getCart() async {
    try {
      var response =
          await DioProvider.get(endpoint: AppEndpoints.getCart, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
      });
      if (response.statusCode == 200) {
        var model = GetCartResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  //  static Future<GetCartResponseModel?> updateProfile() async {
  //   try {

  //     var response =
  //         await DioProvider.post(endpoint: AppEndpoints.getCart,
  //          data: FormData.fromMap({
  //            if (path != null)
  //           'image': await MultipartFile.fromFile(path,
  //               filename: path.split('/').last),
  //         'phone': phone,
  //         'address': address
  //          }),
  //          headers: {
  //       "Authorization":
  //           "Bearer ${AppLocalStorage.getCachedData(key: AppLocalStorage.token)}"
  //     });
  //     if (response.statusCode == 200) {
  //       var model = GetCartResponseModel.fromJson(response.data);
  //       return model;
  //     } else {
  //       return null;
  //     }
  //   } on Exception catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }
}
