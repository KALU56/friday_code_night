import 'package:flutter/material.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatelessWidget {
  const MyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      title: 'Auth Page',
      initialRoute: '/welcome',
      routes: {
        '/Login': (context) => const Login(),
        '/Signup': (context) => const Signup(),
        '/welcome':(context) => const Welcome(),
      },
    
     
    );
  }
}