import 'package:chatapp/cubits/friend_requests/friend_requests_cubit.dart';
import 'package:chatapp/cubits/friend_requests/friend_requests_state.dart';
import 'package:chatapp/cubits/users_cubit/users_cubit.dart';
import 'package:chatapp/cubits/users_cubit/users_cubit_state.dart';
import 'package:chatapp/widget/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  @override
  void initState() {
    final users = context.read<UsersCubit>();
    if (users.users.isEmpty) {
      users.getAllUsers();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UsersSuccessful) {
            final users = state.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserTile(
                  users: users[index],
                  trailing: BlocBuilder<FriendRequestsCubit, FriendState>(
                    builder: (context, state) {
                      if (state is AddFriendSuccess &&
                          state.friendId == users[index].id) {
                        return const Icon(
                          Icons.pending_actions,
                          color: Colors.orange,
                        );
                      }
                      return IconButton(
                        onPressed: () {
                          context.read<FriendRequestsCubit>().addFriends(
                            friendId: users[index].id,
                          );
                        },
                        icon: const Icon(Icons.add),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
