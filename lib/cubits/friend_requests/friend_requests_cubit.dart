import 'package:chatapp/cubits/friend_requests/friend_requests_state.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/repository/friend_requests_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendRequestsCubit extends Cubit<FriendState> {
  FriendRequestsCubit() : super(FriendInitial());
  List<UserModel> friends = [];
  getPendingRequests() async {
    emit(FriendLoading());
    try {
      final result = await FriendRequestsRepository().getPendingRequests();
      friends = result;
      emit(FriendSuccessful(friends: friends));
    } catch (e) {
      emit(FriendFailed());
    }
  }

  rejectFriendRequest({required int friendId}) async {
    try {
      final isDeleted = await FriendRequestsRepository().rejectFriendRequest(
        friendId: friendId,
      );
      if (isDeleted) {
        friends.removeWhere((user) => user.id == friendId);
        emit(FriendSuccessful(friends: friends));
      }
    } catch (e) {
      emit(FriendFailed());
    }
  }
}
