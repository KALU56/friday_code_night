import 'package:flutter/material.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';
import 'screens/welcome.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatelessWidget {
  const MyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  
      title: 'Auth Page',
      initialRoute: '/welcome',
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/welcome':(context) => const Welcome(),
        '/home':(context) => const Home(),
      },
    
     
    );
  }
}