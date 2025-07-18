import 'package:flutter/material.dart';

void main() {
  runApp(const Card());
}
class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Cards();
  }
}
class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('profile'),
        ),
        body: Center(
        child:   Column(
          
          children: [
            SizedBox(
              height: 70,
            ),
           
            
            
            ClipOval(
              child: Image.asset(
                'assets/images/image.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'name : kalkidan',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'phone_no : 090000000',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'made by: kal',
              style: TextStyle(fontSize: 22),
            ),

                      ]
        )
     
          
         
        ),
      ),
    );
  }
}