import 'package:flutter/material.dart';
import './screen/home.dart';
import './screen/detal.dart';
import './screen/wellcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Nav Demo',
      debugShowCheckedModeBanner: false,
      home: const MainPage(), // 👈 Set MainPage as the starting screen
      routes: {
        '/home': (context) => const HomePage(),
        '/detal': (context) => const DetalPage(),
        '/wellcome': (context) => const Wellcome(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List of your actual screen widgets
  final List<Widget> _screens = [
    HomePage(),
    DetalPage(),
    Wellcome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // 👈 Show screen based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waving_hand),
            label: 'Welcome',
          ),
        ],
      ),
    );
  }
}
