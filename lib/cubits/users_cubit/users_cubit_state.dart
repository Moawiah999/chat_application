import 'package:chatapp/models/user_model.dart';

class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSuccessful extends UsersState {
   final List<UserModel> users;

  UsersSuccessful({required this.users});
}

class UsersFailed extends UsersState {}
