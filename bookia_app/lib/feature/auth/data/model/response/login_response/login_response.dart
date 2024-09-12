import 'data.dart';

class LoginResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  LoginResponse({this.data, this.message, this.error, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as int?,
      );
}
