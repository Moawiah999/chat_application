import 'package:chatapp/cubits/auth_cubits/auth_user_state.dart';
import 'package:chatapp/service/auth/auth_user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthUserCubit extends Cubit<AuthState> {
  AuthUserCubit() : super(AuthInitial());
  registration({required name, required email, required password}) async {
    emit(AuthLoading());
    try {
      final result = await AuthUserServices().registrationUser(
        name: name,
        email: email,
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
}
