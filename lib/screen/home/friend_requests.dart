import 'package:chatapp/cubits/friend_requests/friend_requests_cubit.dart';
import 'package:chatapp/cubits/friend_requests/friend_requests_state.dart';
import 'package:chatapp/widget/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendRequests extends StatefulWidget {
  const FriendRequests({super.key});

  @override
  State<FriendRequests> createState() => _FriendRequestsState();
}

class _FriendRequestsState extends State<FriendRequests> {
  @override
  void initState() {
    final friends = context.read<FriendRequestsCubit>();
    if (friends.friends.isEmpty) {
      friends.getPendingRequests();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FriendRequestsCubit, FriendState>(
        builder: (context, state) {
          if (state is FriendLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FriendSuccessful) {
            final friends = state.friends;
            return ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return UserTile(
                  users: friends[index],
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.close, color: Colors.red, size: 30),
                    ],
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
