import 'package:chatapp/models/user_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.users, required this.trailing});

  final UserModel users;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          title: Text(users.name),
          subtitle: Text(users.email),
          leading: Icon(Icons.person),
          trailing: trailing,
        ),
      ),
    );
  }
}
