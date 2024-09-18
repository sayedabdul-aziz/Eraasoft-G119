import 'dart:developer';

import 'package:bookia_app/core/constants/endpoints.dart';
import 'package:bookia_app/core/services/dio/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/model/response/get_banner_response_model/get_banner_response_model.dart';
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
}
