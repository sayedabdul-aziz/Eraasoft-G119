class AuthState {}

class AuthInitial extends AuthState {}

// login
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

// register
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

// doctor register
class DoctorRegistrationLoadingState extends AuthState {}

class DoctorRegistrationSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
