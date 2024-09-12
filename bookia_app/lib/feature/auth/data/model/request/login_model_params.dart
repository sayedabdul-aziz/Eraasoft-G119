class LoginModelParams {
  String? email;
  String? password;

  LoginModelParams({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
