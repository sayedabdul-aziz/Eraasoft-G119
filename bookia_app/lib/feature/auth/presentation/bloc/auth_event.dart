import 'package:bookia_app/feature/auth/data/model/request/login_model_params.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModelParams params;
  LoginEvent(this.params);
}
