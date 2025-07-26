import 'package:flutter/material.dart';
import '../core/assets.dart';
import './verification.dart';
import './login_siginup.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
          SizedBox(height: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'forget password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 1),
              Text('enter yor email account to reset password'),
             
            ],
          ),
          SizedBox(height: 45),
           Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.forgot),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                   TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1.5,
                        ),
                      ),
                      hintText: 'Enter your email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    
                  ), 
                  SizedBox(height: 24),
                 ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Verification()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 172, 118),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center(child: Text('Continue')),
                  ),
                   
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginSiginup()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 244, 245, 244),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(child: Text('Cancel')),
                ),
        ],
      ),
    );
  }
}