import 'package:chatapp/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UsersService {
  final _storage = const FlutterSecureStorage();
  late UserModel userModel;
  Future<List<UserModel>> getAllUsersService() async {
    String? token = await _storage.read(key: 'token');
    final response = await Dio().get(
      '${dotenv.env['Base_URL']}users/',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final users = (response.data as List)
        .map((user) => UserModel.fromJson(user))
        .toList();
    return users;
  }
}
