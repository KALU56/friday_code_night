import 'package:flutter/material.dart';
// import './screen/home.dart';
// import 'screen/detal.dart';
import 'screen/wellcome.dart';
import 'screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const Wellcome(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}