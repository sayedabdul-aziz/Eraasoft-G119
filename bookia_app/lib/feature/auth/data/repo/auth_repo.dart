import 'dart:developer';

import 'package:bookia_app/core/constants/endpoints.dart';
import 'package:bookia_app/core/services/dio/dio_provider.dart';
import 'package:bookia_app/feature/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/feature/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/feature/auth/data/model/response/auth_response/login_response.dart';

class AuthRepo {
  static Future<AuthModelResponse?> register(RegisterModelParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.register, data: params.toJson());
      if (response.statusCode == 201) {
        // parse the response to model
        var model = AuthModelResponse.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthModelResponse?> login(LoginModelParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.login, data: params.toJson());
      if (response.statusCode == 200) {
        // parse the response to model
        var model = AuthModelResponse.fromJson(response.data);
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
