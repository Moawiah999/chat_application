import 'package:chatapp/service/friend_requests/friend_requests_service.dart';

class FriendRequestsRepository {
  getPendingRequests() async {
    final result = await FriendRequestsService().getFriendRequests();
    return result;
  }

  Future<bool> rejectFriendRequest({required int friendId}) async {
    final result = await FriendRequestsService().rejectFriendRequest(
      friendId: friendId,
    );
    return result;
  }
}
