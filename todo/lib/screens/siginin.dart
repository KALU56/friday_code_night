import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/siginup.dart';

class Siginin extends StatefulWidget {
  const Siginin({super.key});

  @override
  State<Siginin> createState() => _SigininState();
}

class _SigininState extends State<Siginin> {
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
           Row(
            children: [
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
                      ElevatedButton(
                    onPressed: (){
                             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Siginup()),
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
                      child: Text('sigin up'),
                    ),
                  ),

            ],
           )
              
        ],
      ),
    )));
  }
}
