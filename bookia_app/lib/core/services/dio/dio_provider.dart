import 'package:bookia_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return await _dio.post(
      endpoint,
      queryParameters: data,
      data: data,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return await _dio.delete(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put(
      {required String endpoint,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
