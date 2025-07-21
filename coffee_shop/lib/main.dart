import 'package:flutter/material.dart';
import './screen/Home.dart';
import 'screen/Detal.dart';
import 'screen/Wellcome.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/Wellcome',
      routes: {
       
        '/Home': (context) => const HomePage(),
        '/Detal': (context) => const DetalPage(),
        '/Wellcome': (context) => const Wellcome(),
      },

    
    
    );
  }
}
