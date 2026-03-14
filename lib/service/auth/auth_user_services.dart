import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthUserServices {
  registrationUser({required name, required email, required password}) async {
    try {
      Response response = await Dio().post(
        '${dotenv.env['Base_URL']}users/register',
        data: {'name': name, 'email': email, 'password': password},
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
}
