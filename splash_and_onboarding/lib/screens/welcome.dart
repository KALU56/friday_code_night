import 'package:flutter/material.dart';
import '../core/assets.dart';
import './taskugas.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 253, 111),
      body: Center(
        
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            
             Container(
              width: 100,
              height: 100,
          
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.tag),
                  
                 
                ),
              ),
            ),
             const SizedBox(width: 20),
             GestureDetector(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Taskugas()),
                );
                
              },
            child:Text('Tasktugas',style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 22, 126, 1),
            ),)
             ),

          ],




        ),
      ),
    );
  }
}








