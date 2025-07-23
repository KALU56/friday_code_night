import 'package:flutter/material.dart';
import 'Login.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscurePassword = true;

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
                    Text(
            'Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter your Name',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20,),
          Text('Email',
                      style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
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
              Text('Password',
                          style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  hintText: 'Enter your password',
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
                 foregroundColor: const Color.fromARGB(255, 100, 98, 98),
                  minimumSize: const Size(double.infinity, 50), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), 
                  ),
            ),
              child:Center(child: Text('Signup'),),),
          
            
          Center(child: Text('or'),),
         
          SizedBox(height: 20,),
                   Center(
                       child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        'assets/images/github.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("continue with Github"),
                    ],
                  ),
           ),),
                SizedBox(height: 10),
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
                        'assets/images/google.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("continue with  Google"),
                    ],
                  ),
           ),),
                
                SizedBox(height: 10),
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
                        'assets/images/facebook.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text("continue with Facebook"),
                    ],
                  ),
           ),),
              ],
            ),
                   ) ,
       
          

            
          SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      'Login',
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
        

        )
        

      )
    );
  }
}