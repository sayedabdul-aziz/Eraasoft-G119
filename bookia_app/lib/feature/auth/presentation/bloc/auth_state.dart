class AuthState {}

class AuthInitial extends AuthState {}

// LOGIN
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

// REGISTER
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
