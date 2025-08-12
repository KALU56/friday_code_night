import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/siginup.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   Future<void> login() async {
  
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
           

            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
           

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  ElevatedButton(
              onPressed: (){
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }, child: Text('submit')),
                ElevatedButton(
              onPressed: (){
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Siginup()),
                );
              }, child: Text('signup')),

              ],
            )
          

          ],

        )
        
        
        ),
    );
  }
}