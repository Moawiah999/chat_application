import 'package:chatapp/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FriendRequestsService {
  final _storage = const FlutterSecureStorage();
  Future<List<UserModel>> getFriendRequests() async {
    String? token = await _storage.read(key: 'token');
    Response response = await Dio().get(
      '${dotenv.env['Base_URL']}friends/pending-requests',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      final List<UserModel> friendRequests = (response.data['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
      return friendRequests;
    } else {
      throw Exception('Failed to load friend requests');
    }
  }

  Future<bool> rejectFriendRequest({required int friendId}) async {
    try {
      String? token = await _storage.read(key: 'token');
      Response response = await Dio().delete(
        '${dotenv.env['Base_URL']}friends/reject-requests',
        data: {'friend_id': friendId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
