import 'package:flutter/material.dart';
import '../core/assets.dart';
class LoginSiginup extends StatefulWidget {
  const LoginSiginup({super.key});

  @override
  State<LoginSiginup> createState() => _LoginSiginupState();
}

class _LoginSiginupState extends State<LoginSiginup> {
    bool _obscurePassword = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text('Welcome to tasktugas',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),),
                 SizedBox(height: 8),
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


            ),
          
          Expanded(
            
             child: Column(
              children: [
                SizedBox(height: 9,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.appleImage,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 10),
                          Text("login with Apple"),
                        ],
                      ),
                   Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.googleImage,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 10),
                          Text("login with Google"),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('or with continue with email'),
                      SizedBox(height: 15),

                      Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 236, 230, 230),
                          width: 1.5,
                        ),
                      ),
                      hintText: 'Enter your email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Enter a valid email like test@gmail.com';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 236, 230, 230),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          const Text('Remember me'),
                        ],
                      ),

                      GestureDetector(
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Please check your email and password.",
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }
                      Navigator.pushNamed(context, '/home');
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
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color.fromARGB(255, 255, 254, 254),
                  //     foregroundColor: const Color.fromARGB(255, 100, 98, 98),

                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 20,
                  //       vertical: 15,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  // ),


              ],

             ),
            )


        ],
        
        ),
        
        
        );
  }
}