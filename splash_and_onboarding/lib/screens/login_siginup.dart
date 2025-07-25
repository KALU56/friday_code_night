import 'package:flutter/material.dart';
import '../core/assets.dart';
class LoginSiginup extends StatefulWidget {
  const LoginSiginup({super.key});

  @override
  State<LoginSiginup> createState() => _LoginSiginupState();
}

class _LoginSiginupState extends State<LoginSiginup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.tag),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              
            
             Text(
                  'Tasktugas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 22, 126, 1),
                  ),
                ),
            
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to tasktugas',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),),
              const SizedBox(height: 8),
              Text('Welcome to tasktugas to tasktugas'),
              Text('Welcome to tasktugas'),
              
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Login'),
                Text('sign up')
                
              ],


            )
           



        ],
        
        ),
        
        
        );
  }
}