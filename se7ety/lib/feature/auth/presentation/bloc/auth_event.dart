import 'package:se7ety/core/enums/user_type_enum.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final UserType userType;
  LoginEvent(
      {required this.email, required this.password, required this.userType});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final UserType userType;
  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.userType,
  });
}

class DoctorRegistrationEvent extends AuthEvent {
  final DoctorModel doctorModel;
  DoctorRegistrationEvent({required this.doctorModel});
}
