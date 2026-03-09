import 'package:chatapp/screen/home/chat_screen.dart';
import 'package:chatapp/screen/home/friends_screen.dart';
import 'package:chatapp/screen/home/profile_screen.dart';
import 'package:flutter/material.dart';

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
    ProfileScreen(),
  ];
  final List<String> _titles = ['Chats', 'Friends', 'Profile'];

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
            icon: Icon(Icons.person, color: Color(0xFF00BFFF)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
