import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/home.dart';
class Siginup extends StatefulWidget {
  const Siginup({super.key});

  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmpasswordController = TextEditingController();
    Future<void> register() async {
      if (_passwordController.text != _confirmpasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

    
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e')),
        );
      }
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
            SizedBox(height: 16),
            TextField(
              controller: _confirmpasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'confirmpassword',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
           

            ),
            ElevatedButton(
              onPressed: (){
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }, child: Text('Register'))
          ],

        )
        
        
        ),
    );
  }
}