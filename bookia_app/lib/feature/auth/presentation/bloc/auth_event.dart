import 'package:bookia_app/feature/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/feature/auth/data/model/request/register_model_params.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModelParams params;
  LoginEvent(this.params);
}

class RegisterEvent extends AuthEvent {
  final RegisterModelParams params;
  RegisterEvent(this.params);
}
