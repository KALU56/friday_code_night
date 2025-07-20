import 'package:flutter/material.dart';
import './screen/Home.dart';
import 'screen/Detal.dart';
import 'screen/SiginUp.dart';
import './screen/SignIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/SignIn',
      routes: {
        '/SignIn': (context) => const SignInPage(),
        '/Home': (context) => const HomePage(),
        '/Detal': (context) => const DetalPage(),
        '/SignUp': (context) => const SignUpPage(),
      },

    
    
    );
  }
}
