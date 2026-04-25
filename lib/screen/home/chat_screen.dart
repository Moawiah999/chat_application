import 'package:chatapp/cubits/auth_cubits/auth_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authModel = context.read<AuthUserCubit>().authModel;
    return Scaffold(
      body: Center(
        child: Text('Welcome to the chat screen! ${authModel.name}'),
      ),
    );
  }
}
