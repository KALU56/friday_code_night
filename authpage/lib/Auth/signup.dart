import 'package:flutter/material.dart';
import 'login.dart';
import '../core/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscurePassword = true;
  bool _rememberMe = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45,),
          Text('Register Account! ',
                   style: GoogleFonts.roboto(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Colors.black87,
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
              hintText: 'Enter your Name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 236, 230, 230), 
                  width: 1.5,
                ),
              ),
              
            ),
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 20,),
          Text('Email',
                      style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          TextField(
            decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color:  const Color.fromARGB(255, 236, 230, 230), 
        width: 1.5,
      ),
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
            enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
         color: const Color.fromARGB(255, 236, 230, 230), 
        width: 1.5,
      ),
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
                        Assets.githubImage,
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
                        Assets.googleImage,
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
                        Assets.facebookImage,
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