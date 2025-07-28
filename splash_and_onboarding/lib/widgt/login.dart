import 'package:flutter/material.dart';
import '../core/assets.dart';
import '../screens/forgot_password.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return   Form(
  
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
             color: const Color.fromARGB(255, 236, 234, 234),
              child: Column(
              children: [
                SizedBox(height: 9,),
               ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  
                    ),
                    onPressed: () {
                     
                    },
                    child: Row(
                 
                      children: [
                        Image.asset(
                          Assets.appleImage,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login with Apple",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
        
                    ),
                    onPressed: () {
                     
                    },
                    child: Row(
                 
                      children: [
                        Image.asset(
                          Assets.googleImage,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                      SizedBox(height: 15),
                      Text('or with continue with email'),
                      SizedBox(height: 15),

                  
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
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
                  SizedBox(height: 20),
               
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  
                  ),
                  SizedBox(height: 20),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                  ),
                                

                      
                        
                      
                    
                    
                    SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 172, 118),
                      foregroundColor: const Color.fromARGB(255, 248, 245, 245),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: Center(child: Text('Login')),
                  ),

                  SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      

                      Text('By signing up you agree to our '),
                      Text(
                        'Terms of service',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('and '),
                      Text(
                        'privacy policy',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),

                  


              ],

             ),
             ),
        ],
      ),
    ),
  );
  }
}