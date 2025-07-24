import 'package:flutter/material.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatelessWidget {
  const MyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      title: 'Auth Page',
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => const Login(),
        '/Signup': (context) => const Signup(),
      },
    
     
    );
  }
}