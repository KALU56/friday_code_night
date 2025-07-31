import 'package:flutter/material.dart';

class AllDetal extends StatefulWidget {
  const AllDetal({super.key});

  @override
  State<AllDetal> createState() => _AllDetalState();
}

class _AllDetalState extends State<AllDetal> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
           appBar: AppBar(
        title: Center(child: Text('All Task List',style: TextStyle(fontWeight: FontWeight.bold),))
 
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Text('Today'),
                ),
                 GestureDetector(
                  onTap: (){},
                  child: Text('Daily'),
                ),
                 GestureDetector(
                  onTap: (){},
                  child: Text('Monthly'),
                ),
                 GestureDetector(
                  onTap: (){},
                  child: Text('weekly'),
                )
                
            
              ],
            ),
          )
        ],
      )
    )
    
    
    );
  }
}