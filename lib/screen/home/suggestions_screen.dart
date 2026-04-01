import 'package:chatapp/cubits/users_cubit/users_cubit.dart';
import 'package:chatapp/cubits/users_cubit/users_cubit_state.dart';
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                      leading: Icon(Icons.person),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("حدث خطأ:"));
          }
        },
      ),
    );
  }
}
