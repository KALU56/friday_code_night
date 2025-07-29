import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Hello jack'),
                    Text('you have work today')
                  ],
                ),
             
                    Icon(Icons.notification_add)

              ],
            ),
            Row(
              children: [
                    Container(
                    padding: EdgeInsets.all(16),
                    color: const Color.fromARGB(255, 136, 205, 245),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(Icons.access_time, color: const Color.fromARGB(255, 189, 189, 188)),
                         SizedBox(height: 10),
                        Row(
                          children: [
                            
                            Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        
                           
                            SizedBox(width: 8),
                            Text("Rating: 5"),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(width: 10),

                  Container(
                    padding: EdgeInsets.all(16),
                    color: const Color.fromARGB(255, 136, 205, 245),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(Icons.access_time, color: const Color.fromARGB(255, 189, 189, 188)),
                         SizedBox(height: 10),
                        Row(
                          children: [
                            
                            Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        
                           
                            SizedBox(width: 8),
                            Text("Rating: 5"),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],




            ),
            SizedBox(height: 20,),
            
                Row(
              children: [
                    Container(
                    padding: EdgeInsets.all(16),
                    color: const Color.fromARGB(255, 136, 205, 245),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(Icons.access_time, color: const Color.fromARGB(255, 189, 189, 188)),
                         SizedBox(height: 10),
                        Row(
                          children: [
                            
                            Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        
                           
                            SizedBox(width: 8),
                            Text("Rating: 5"),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(width: 10),

                  Container(
                    padding: EdgeInsets.all(16),
                    color: const Color.fromARGB(255, 136, 205, 245),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(Icons.access_time, color: const Color.fromARGB(255, 189, 189, 188)),
                         SizedBox(height: 10),
                        Row(
                          children: [
                            
                            Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        
                           
                            SizedBox(width: 8),
                            Text("Rating: 5"),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],),

              Text('today task'),
              











          ],
          
        ),
      ),



    );
  }
}