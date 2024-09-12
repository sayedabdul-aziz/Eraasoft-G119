import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepo.login(event.params).then((value) {
      if (value) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState("Login Failed"));
      }
    });
  }
}
