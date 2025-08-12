import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';

class Siginup extends StatefulWidget {
  const Siginup({super.key});

  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
  @override
    bool _obscurePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
                      ),
            ),

          ),
           TextField(
            controller: passwordController,
            obscureText: _obscurePassword,
           decoration: InputDecoration(
            hintText: 'Enter your password',
          
            prefixIcon: const Icon(Icons.lock),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
           borderSide: const BorderSide(color: Colors.white, width: 1.5),
                      ),
           )),
                  ElevatedButton(
                    onPressed: (){
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text('Login'),
                    ),
                  ),
        ],
      ),
    )));
  }
}
