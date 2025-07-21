// lib/widgets/bottom_nav.dart
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.brown[800],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.brown[200],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
