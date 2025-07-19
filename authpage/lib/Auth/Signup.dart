import 'package:flutter/material.dart';
import 'Login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Text('Register Account! ',
            style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20, 
  ),),
          SizedBox(height: 15,),

          Text('Fill your details or continue '),
          Text('with social media'),
          SizedBox(height: 15,),
          Text('Name'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your Name',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20,),
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
              ],
            ),

          SizedBox(width: 20,),
       
          ElevatedButton(
                      
            
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 23, 223, 156),
              
            ),
              child:Center(child: Text('Signup'),),),
          
            
          Center(child: Text('or'),),
         
          SizedBox(height: 20,),
                   Center(
                       child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/github.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("Sign in with github"),
                    ],
                  ),
                SizedBox(height: 10),
               Row(
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
                
                SizedBox(height: 10),
               Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("Sign in with facebook"),
                    ],
                  ),
              ],
            ),
                   ) ,
       
          

            
          SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                 Text('Aleady have an account? '),
                 SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text('Login'),
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