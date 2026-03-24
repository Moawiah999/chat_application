import 'package:chatapp/cubits/users_cubit/users_cubit_state.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/service/auth/users_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  List<UserModel> users = [];
  getAllUsers() async {
    emit(UsersLoading());
    try {
      final result = await UsersService().getAllUsersService();
      users = result;
      emit(UsersSuccessful(users: users));
    } catch (e) {
      emit(UsersFailed());
    }
  }
}
