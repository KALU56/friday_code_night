import 'package:flutter/material.dart';
import '../core/assets.dart';
import '../widgt/login.dart';
import '../widgt/siginup.dart';

class LoginSiginup extends StatefulWidget {
  const LoginSiginup({super.key});

  @override
  State<LoginSiginup> createState() => _LoginSiginupState();
}

class _LoginSiginupState extends State<LoginSiginup> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
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
              Text(
                'Welcome to tasktugas',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 8),
              Text('Welcome to tasktugas to tasktugas'),
              Text('Welcome to tasktugas'),
            ],
          ),
          SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = true;
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: isLogin ? FontWeight.bold : FontWeight.normal,
                    color: isLogin ? Colors.black : Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = false;
                  });
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: !isLogin ? FontWeight.bold : FontWeight.normal,
                    color: !isLogin ? Colors.black : Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
                  Expanded(
            child: Container(
              color: const Color.fromARGB(255, 236, 234, 234), // background for both
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: isLogin ? const Login() : const Siginup(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
