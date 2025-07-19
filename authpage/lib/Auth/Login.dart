import 'package:flutter/material.dart';
import '../Auth//Signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back!'),
        
      ),
      body: SingleChildScrollView(
      child:Padding(
          padding: const EdgeInsets.all(16.0),    
      child :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(height: 15,),

          Text('Fill your details or continue with social media'),
          SizedBox(height: 15,),
          Text('Email'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20,),
          Text('Password'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20,),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text('Remember me'),
                SizedBox(width: 50,),
                Text('forget password?'),

              ],
            ),

          
          
          SizedBox(height: 20,),
          ElevatedButton(
                      
            
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              
            ),
              
          
            child:Center(
              child: Text('Login'),
            ) ),

          
          SizedBox(height: 20,),
          
           Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("Sign in with Google"),
                    ],
                  ),
           ),
            
          SizedBox(height: 20,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('New User? Create an account'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            )
                      
        
        ],

      )
    )
    )
    );
  }
}