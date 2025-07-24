import 'package:flutter/material.dart';
import '../core/assets.dart';
import 'signup.dart';
import 'package:google_fonts/google_fonts.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
      child:Padding(
          padding: const EdgeInsets.all(16.0), 
           child: Form(
          key: _formKey,   
      child :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45,),
              Text(
            'Welcome Back!',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 15,),

          Text('Fill your details or continue '),
          Text('with social media'),
          SizedBox(height: 25,),
          Text('Email',            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
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
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email like test@gmail.com';
    }
    return null;
  },
          ),
          SizedBox(height: 20,),
                  Text('Password',            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
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
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
          SizedBox(height: 20,),
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
      ),),

              ],
            ),
    
          
          SizedBox(height: 20,),
          ElevatedButton(
                      
            
            onPressed: (
              
            ) {
              if (!_formKey.currentState!.validate()) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Please check your email and password."),
      backgroundColor: Colors.orange,
    ),
  );
  return; 
}  Navigator.pushNamed(context, '/home');

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 11, 172, 118),
              foregroundColor: const Color.fromARGB(255, 248, 245, 245),
                  minimumSize: const Size(double.infinity, 50), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                ),

            ),
              
          
            child:Center(
              child: Text('Login'),
            ) ),

          
          SizedBox(height: 20,),
           ElevatedButton(onPressed: (){}, 
           style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 254, 254),
    foregroundColor: const Color.fromARGB(255, 100, 98, 98),

    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), 
    
    ),

           ),
           child:  Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.googleImage,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("Sign in with Google"),
                    ],
                  ),
           ),),
          
  
            
          SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text('New User? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        
                        ),
                      ),
                    ),
                  ],
              ),
            )
                      
        
        ],

      )
    ),
      )
    )
    );
  }
}
