import 'package:flutter/material.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
 
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
            width: screenWidth,
            height: 400, 
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/images/coffee.png'), 
                fit: BoxFit.cover,
              ),

            ),
            child: Container(
              color: const Color.fromARGB(136, 31, 0, 0),
                          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                  children: const [
                    SizedBox(height: 350), 
                    
                    Text(
                      'Welcome to Coffee Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Color.fromARGB(228, 0, 0, 0),
                            offset: Offset(2, 2),
                          )
                        ],
                        
                      ),
                    ),
                  ],
              ),

            ),
            

            ),

            
              
            ),
            Expanded(child: 
            Container(
              width: screenWidth,
              color: const Color.fromARGB(235, 32, 1, 1),
              child:Column(
                children: [
              
                                  Text(
                      'Awaken Your Senses',
                      
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Color.fromARGB(228, 0, 0, 0),
                            offset: Offset(2, 2),
                          )
                        ],
                        
                      ),
                    ),
                                                      Text(
                      'with the perfect brew!',
                      
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Color.fromARGB(228, 0, 0, 0),
                            offset: Offset(2, 2),
                          )
                        ],
                        
                      ),
                    ),
                    SizedBox(height: 50),
          
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 241, 240),
                
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              child: Text('GET STARTED'),
            ),

            const SizedBox(height: 10), 

          

                ],
              )

            ))
            






        ],),











      ),
    );
  }
}