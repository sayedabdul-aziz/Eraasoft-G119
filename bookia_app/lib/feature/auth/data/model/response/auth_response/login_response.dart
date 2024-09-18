import 'data.dart';

class AuthModelResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  AuthModelResponse({this.data, this.message, this.error, this.status});

  factory AuthModelResponse.fromJson(Map<String, dynamic> json) =>
      AuthModelResponse(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as int?,
      );
}
