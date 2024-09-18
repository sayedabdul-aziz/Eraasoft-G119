import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepo.login(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(LoginSuccessState());
      } else {
        emit(AuthErrorState("Login Failed"));
      }
    });
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    await AuthRepo.register(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(RegisterSuccessState());
      } else {
        emit(AuthErrorState("Register Failed"));
      }
    });
  }
}
