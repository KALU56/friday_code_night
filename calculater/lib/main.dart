import 'package:flutter/material.dart';

void main() {
  runApp(const Calculater());
}

class Calculater extends StatelessWidget {
  const Calculater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calculator', home: CalculaterUi());
  }
}

class CalculaterUi extends StatelessWidget {
  const CalculaterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator'))
        , body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          children:[
            Row(
              children:[
                Expanded(
            child:
          
            
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the first number ',
            ),
               ),

           ),
           SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('+'),
            ),
            
            ],
            
            
            ),
            const SizedBox(height: 20),
          
             Row(
              children:[
                Expanded(
            child:
          
            
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the first number ',
            ),
               ),

           ),
           SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('='),
            ),
            
            ],  
            
            
            ),
    
        
        ],
          ),
        ),
        );

  }
}
