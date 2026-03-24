import 'package:chatapp/cubits/auth_cubits/auth_user_state.dart';
import 'package:chatapp/models/auth_model.dart';
import 'package:chatapp/service/auth/auth_user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthUserCubit extends Cubit<AuthState> {
  late AuthModel authModel;

  AuthUserCubit() : super(AuthInitial());
  registration({
    required name,
    required email,
    required gender,
    required password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await AuthUserServices().registrationUser(
        name: name,
        email: email,
        gender: gender,
        password: password,
      );
      if (result['status'] == true) {
        emit(AuthSuccessfulRegistration());
      } else {
        emit(AuthFailedRegistration());
      }
    } catch (e) {
      emit(AuthFailedRegistration());
    }
  }

  login({required email, required password}) async {
    emit(AuthLoading());

    try {
      authModel = await AuthUserServices().loginUser(
        email: email,
        password: password,
      );

      emit(AuthSuccessfulLogin());
    } on Exception catch (e) {
      final msg = e.toString();

      if (msg.contains('Email or password incorrect')) {
        emit(AuthInvalidCredentials());
      } else if (msg.contains('User not found')) {
        emit(AuthUserNotFound());
      } else {
        emit(AuthFailedLogin());
      }
    }
  }
}
