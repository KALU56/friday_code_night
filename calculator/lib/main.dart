import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

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
                SizedBox(height: 40),
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
            SizedBox(width: 10),
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
              Expanded(
            child:
          
            
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Result', 
            ),
               ),

           ),
            
            ],// children row 1
            
            
            ),// row 1



            
            const SizedBox(height: 40),
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
              child: const Text('-'),
            ),
            SizedBox(width: 10),
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
              Expanded(
            child:
          
            
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Result', 
            ),
               ),

           ),
            
            ],// children row 2
            
            
            ),//row2
    
        
        ],
          ),
        ),
        );

  }
}
