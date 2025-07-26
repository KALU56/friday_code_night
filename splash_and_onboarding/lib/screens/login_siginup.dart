import 'package:flutter/material.dart';
import '../core/assets.dart';
class LoginSiginup extends StatefulWidget {
  const LoginSiginup({super.key});

  @override
  State<LoginSiginup> createState() => _LoginSiginupState();
}

class _LoginSiginupState extends State<LoginSiginup> {
    bool _obscurePassword = true;
    bool isLogin = true;
    

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Padding(
        
       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      
       child: 
       
       
       
      Column(
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
                    color: const Color.fromARGB(255, 196, 180, 180),
                    child: isLogin ? buildLoginUI() : buildSignupUI(),
                  ),
                ),

          
          


        ],
        
        ),
        
      )
        );
  }
}
Widget buildLoginUI() {
  return Form(
    // key: _formKey,
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
              color: const Color.fromARGB(255, 196, 180, 180),
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
                    
                  ),
                  SizedBox(height: 20),
               
                  TextField(
                    // obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 236, 230, 230),
                          width: 1.5,
                        ),
                      ),
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _obscurePassword
                      //         ? Icons.visibility_off
                      //         : Icons.visibility,
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       _obscurePassword = !_obscurePassword;
                      //     });
                      //   },
                      // ),
                    ),
                  
                  ),
                  SizedBox(height: 20),
                  
    
              

                      
                        
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                          
                          ),
                        ),
                    
                    
                    SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // if (!_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //         "Please check your email and password.",
                      //       ),
                      //       backgroundColor: Colors.orange,
                      //     ),
                      //   );
                      //   return;
                      // }
                      // Navigator.pushNamed(context, '/home');
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
Widget buildSignupUI() {
  return Form(
    // key: _formKey,
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Replace with sign up fields
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter your name'),
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter your name'
                : null,
          ),
          SizedBox(height: 10),
          // Add email, password, confirm password
          // Add Signup Button
          // Terms & Privacy
        ],
      ),
    ),
  );
}
