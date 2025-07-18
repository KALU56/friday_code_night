import 'package:flutter/material.dart';
import './siginin.dart';
import './siginup.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      initialRoute: '/signup',
      routes: {
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const Home(),
      },
    );
  }
}
