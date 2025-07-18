import 'package:flutter/material.dart';
import './home.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('siginin'),),
      body:Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())); 
        }, child: Text('login')),
      )
    );
  }
}