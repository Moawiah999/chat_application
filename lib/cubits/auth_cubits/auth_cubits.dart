import 'package:chatapp/cubits/auth_cubits/auth_user_state.dart';
import 'package:chatapp/models/auth_model.dart';
import 'package:chatapp/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthUserCubit extends Cubit<AuthState> {
  late AuthModel authModel;
  late AuthRepository _authRepository = AuthRepository();
  AuthUserCubit() : super(AuthInitial());
  registration({
    required name,
    required email,
    required gender,
    required password,
  }) async {
    emit(AuthLoading());
    try {
      final success = await _authRepository.register(
        name: name,
        email: email,
        gender: gender,
        password: password,
      );
      if (success) {
        emit(AuthSuccessfulRegistration());
      } else {
        emit(AuthFailedRegistration());
      }
    } catch (_) {
      emit(AuthFailedRegistration());
    }
  }

  login({required email, required password}) async {
    emit(AuthLoading());
    try {
      authModel = await _authRepository.login(email: email, password: password);
      emit(AuthSuccessfulLogin());
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('Email or password incorrect')) {
        emit(AuthInvalidCredentials());
      } else if (msg.contains('User not found')) {
        emit(AuthUserNotFound());
      } else {
        print(msg);
        emit(AuthFailedLogin());
      }
    }
  }
}
