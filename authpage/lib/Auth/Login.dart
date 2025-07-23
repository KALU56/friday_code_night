import 'package:flutter/material.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
      child:Padding(
          padding: const EdgeInsets.all(16.0),    
      child :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45,),
          Text('Welcome Back!',
            style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20, 
  ),),
          SizedBox(height: 15,),

          Text('Fill your details or continue '),
          Text('with social media'),
          SizedBox(height: 25,),
          Text('Email'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter your email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20,),
              TextField(
                obscureText: _obscurePassword, 
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
              ),
          SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                 child: Row(
                  children: [
                                  Checkbox(
                  value: true,
                  onChanged: null,
                ),
                Text('Remember me'),
                  ],
                 )
        
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
                      
            
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 23, 223, 156),
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
    foregroundColor: const Color.fromARGB(255, 177, 176, 176),

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
                        'assets/images/google.png',
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                 Text('New User? '),
                 SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Text('Create an account'),
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