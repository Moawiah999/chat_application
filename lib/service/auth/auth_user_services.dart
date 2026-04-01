import 'package:chatapp/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthUserServices {
  final _storage = const FlutterSecureStorage();
  late AuthModel authModel;
  registrationUser({
    required name,
    required email,
    required gender,
    required password,
  }) async {
    try {
      Response response = await Dio().post(
        '${dotenv.env['Base_URL']}users/register',
        data: {
          'name': name,
          'email': email,
          'gender': gender,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        return {'status': true, 'message': response.data['message']};
      } else {
        return {'status': false, 'message': 'User creation failed'};
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 409) {
        return {'status': false, 'message': 'Email already exists'};
      }
      return {'status': false, 'message': 'Server error'};
    }
  }

  loginUser({required email, required password}) async {
    try {
      Response response = await Dio().post(
        '${dotenv.env['Base_URL']}users/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final String token = response.data['token'];
        await _storage.write(key: 'token', value: token);
        Map<String, dynamic> payload = Jwt.parseJwt(token);
        authModel = AuthModel(
          name: payload['name'],
          email: payload['email'],
          gender: payload['gender'],
        );
        return authModel;
      }
      throw Exception('Server error');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Email or password incorrect');
      } else if (e.response?.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('Server error');
      }
    }
  }
}
