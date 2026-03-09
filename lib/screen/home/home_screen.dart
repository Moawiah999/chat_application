import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF00BFFF)),
      backgroundColor: Color(0xFFF0F5F8),
      bottomNavigationBar: NavigationBar(
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
