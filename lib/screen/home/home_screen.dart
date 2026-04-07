import 'package:chatapp/cubits/friend_requests/friend_requests_cubit.dart';
import 'package:chatapp/cubits/friend_requests/friend_requests_state.dart';
import 'package:chatapp/screen/home/chat_screen.dart';
import 'package:chatapp/screen/home/friends_screen.dart';
import 'package:chatapp/screen/home/friend_requests.dart';
import 'package:chatapp/screen/home/profile_screen.dart';
import 'package:chatapp/screen/home/suggestions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    ChatScreen(),
    FriendsScreen(),
    SuggestionsScreen(),
    FriendRequests(),
    ProfileScreen(),
  ];
  final List<String> _titles = [
    'Chats',
    'Friends',
    'Suggestions',
    'Requests',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Color(0xFF00BFFF),
        title: Text(_titles[_selectedIndex]),
      ),
      backgroundColor: Color(0xFFF0F5F8),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
              color: Color(0xFF00BFFF),
            ),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.group, color: Color(0xFF00BFFF)),
            label: 'Friends',
          ),
          NavigationDestination(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF00BFFF)),
            label: 'Suggestions',
          ),
          NavigationDestination(
            icon: BlocBuilder<FriendRequestsCubit, FriendState>(
              builder: (context, state) {
                int count = 0;
                if (state is FriendSuccessful) {
                  count = state.friends.length;
                }
                if (count == 0) {
                  return const Icon(
                    Icons.notifications_active,
                    color: Color(0xFF00BFFF),
                  );
                }
                return Badge(
                  label: Text('$count'),
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.notifications_active,
                    color: Color(0xFF00BFFF),
                  ),
                );
              },
            ),
            label: 'Requests',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Color(0xFF00BFFF)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
