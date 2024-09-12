class AuthState {}

class AuthInitial extends AuthState {}

// LOGIN
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}
