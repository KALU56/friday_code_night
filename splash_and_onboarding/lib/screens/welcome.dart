import 'package:flutter/material.dart';
import '../core/assets.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Center(
        
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            
             Container(
          
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.tag),
                 
                ),
              ),
            ),
            Text('Tasktugas',style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 100, 245, 4),
            ),)

          ],




        ),
      ),
    );
  }
}