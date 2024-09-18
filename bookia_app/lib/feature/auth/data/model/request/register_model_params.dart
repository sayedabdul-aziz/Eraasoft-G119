class RegisterModelParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterModelParams({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
