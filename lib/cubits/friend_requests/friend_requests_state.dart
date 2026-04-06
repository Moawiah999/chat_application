import 'package:chatapp/models/user_model.dart';

class FriendState {}

class FriendInitial extends FriendState {}

class FriendLoading extends FriendState {}

class FriendSuccessful extends FriendState {
  List<UserModel> friends = [];
  FriendSuccessful({required this.friends});
}

class FriendFailed extends FriendState {}
