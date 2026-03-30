import 'package:chatapp/models/auth_model.dart';
import 'package:chatapp/service/auth/auth_user_services.dart';

class AuthRepository {
  final AuthUserServices _authServices = AuthUserServices();

  Future<bool> register({
    required String name,
    required String email,
    required String gender,
    required String password,
  }) async {
    final result = await _authServices.registrationUser(
      name: name,
      email: email,
      gender: gender,
      password: password,
    );
    return result['status'] == true;
  }

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    return await _authServices.loginUser(email: email, password: password);
  }
}
