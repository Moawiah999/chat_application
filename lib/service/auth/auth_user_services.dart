import 'package:chatapp/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthUserServices {
  late UserModel userModel;
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
        Map<String, dynamic> payload = Jwt.parseJwt(token);
        userModel = UserModel(
          name: payload['name'],
          email: payload['email'],
          gender: payload['gender'],
          token: token,
        );
        return userModel;
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
