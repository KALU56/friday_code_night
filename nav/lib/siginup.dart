import 'package:flutter/material.dart';
import './home.dart';
import './siginin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('siginup')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                child: Text('login'),
              ),
              SizedBox(height: 16), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: Text('signin'),
              ),
            ],
          ),
        ),

    );
  }
}
