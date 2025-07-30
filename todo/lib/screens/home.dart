import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello jack',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('you have work today')
                    ],
                  ),
               
                      Icon(Icons.notification_add)
        
                ],
              ),
          
        
                Row(
                      children: [
                       Expanded(child: 
                        Container(
                        padding: EdgeInsets.all(16),
                        
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 136, 205, 245),
                     ),
                    
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Icon(Icons.access_time, color: const Color.fromARGB(255, 250, 250, 248)),
                             SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            
                               
                                SizedBox(width: 8),
                                Text(" 5"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                    SizedBox(width: 10),
                    Expanded(child: 
                    
                      Container(
                        padding: EdgeInsets.all(16),
                        
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 136, 205, 245),
                     ),
                    
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Icon(Icons.access_time, color: const Color.fromARGB(255, 250, 250, 248)),
                             SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            
                               
                                SizedBox(width: 8),
                                Text(" 5"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      
                                  ],),
                  
              SizedBox(height: 20,),
              
                  
                
                    
                  Row(
                        children: [
                         Expanded(child: 
                        Container(
                        padding: EdgeInsets.all(16),
                      
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 136, 205, 245),
                     ),
                    
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Icon(Icons.access_time, color: const Color.fromARGB(255, 250, 250, 248)),
                             SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            
                               
                                
                                Text("5"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                    SizedBox(width: 10),
                    Expanded(child: 
                    
                      Container(
                        padding: EdgeInsets.all(16),
                        
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 136, 205, 245),
                     ),
                    
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Icon(Icons.access_time, color: const Color.fromARGB(255, 250, 250, 248)),
                             SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            
                               
                             
                                Text(" 5"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      
                                  ],),
                  
               SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('today task',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.all(16),
                    
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 136, 205, 245),
                        borderRadius: BorderRadius.circular(105),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                           
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                 Icon(Icons.access_time, color: const Color.fromARGB(255, 255, 255, 255)),
                                 Text('today'),
                                SizedBox(width: 10),
                                Icon(Icons.access_time, color: const Color.fromARGB(255, 253, 253, 252)),
                                SizedBox(width: 10),
                                Text('4:30pm')
                                    
                              ]
                             
                                    
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            
                          
                            children: [
                               Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                              },
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), ),
                              
                            ),
                              Icon(Icons.access_alarm, color: const Color.fromARGB(255, 189, 189, 188)),
                     
                            ],
                          ),
                          
                      
                              
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                
                                child: Text("project retrospective", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                          
                            
                        ],
                      ),
        
        
        
        
        
        
                ),/////#1
                     SizedBox(height: 20),
                       Container(
                        padding: EdgeInsets.all(16),
                          
                            height: 125,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 136, 205, 245),
                              borderRadius: BorderRadius.circular(105),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              
                                
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: const Color.fromARGB(255, 255, 255, 255)),
                                      Text('today'),
                                      SizedBox(width: 10),
                                      Icon(Icons.access_time, color: const Color.fromARGB(255, 253, 253, 252)),
                                      SizedBox(width: 10),
                                      Text('4:30pm')
                                          
                                    ]
                                  
                                          
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  
                                  
                                
                                  children: [
                                    Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? newValue) {
                                    setState(() {
                                      isChecked = newValue!;
                                    });
                                    },
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50), ),
                                    
                                  ),
                                    Icon(Icons.access_alarm, color: const Color.fromARGB(255, 189, 189, 188)),
                               
                                  ],
                                ),
                                
                            
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      
                                      child: Text("project retrospective", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    ),
                                
                                  
                              ],
                            ),
              
              
              
        
        
        
                ),/////#2
                SizedBox(height: 20),
                       Container(
              
                    
                      // height: 255,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 136, 205, 245),
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                           
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                 Icon(Icons.calendar_today, color: const Color.fromARGB(255, 255, 255, 253)),
                                 Text('today,'),
                             SizedBox(width: 10),
                              Icon(Icons.access_time, color: const Color.fromARGB(255, 253, 253, 252)),
                             SizedBox(width: 10),
                             Text('4:30pm')
                                    
                              ]
                             
                                    
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            
                          
                            children: [
                               Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                              },
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), ),
                              
                            ),
                              Icon(Icons.access_alarm, color: const Color.fromARGB(255, 189, 189, 188)),
                          
                            ],
                          ),
                          
                      
                              
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                
                                child: Text("project retrospective", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Column(
                                  children: [
                                    Row(
                                     children: [
                                           Checkbox(
                                              value: isChecked,
                                              onChanged: (bool? newValue) {
                                              setState(() {
                                                isChecked = newValue!;
                                              });
                                              },
                                              ),
                                            Text('pink up bug')
                                            
                                      ],
                                    ),
                                    Row(
                                     children: [
                                           Checkbox(
                                              value: isChecked,
                                              onChanged: (bool? newValue) {
                                              setState(() {
                                                isChecked = newValue!;
                                              });
                                              },
                                              ),
                                            Text('pink up bug')
                                            
                                      ],
                                    ),
                                    Row(
                                     children: [
                                           Checkbox(
                                              value: isChecked,
                                              onChanged: (bool? newValue) {
                                              setState(() {
                                                isChecked = newValue!;
                                              });
                                              },
                                              ),
                                            Text('pink up bug')
                                            
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          
                            
                        ],
                      ),
        
        
        
        
        
        
                ),/////#3
                
                SizedBox(height: 20),
                      Container(
                  padding: EdgeInsets.all(16),
                    
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 136, 205, 245),
                        borderRadius: BorderRadius.circular(105),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                           
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                  Icon(Icons.calendar_today, color: const Color.fromARGB(255, 255, 255, 255)),
                                 Text('today'),
                                SizedBox(width: 10),
                                Icon(Icons.access_time, color: const Color.fromARGB(255, 253, 253, 252)),
                                SizedBox(width: 10),
                                Text('4:30pm')
                                    
                              ]
                             
                                    
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            
                          
                            children: [
                               Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                              },
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), ),
                              
                            ),
                              Icon(Icons.access_alarm, color: const Color.fromARGB(255, 189, 189, 188)),
                           SizedBox(width: 10),
                            ],
                          ),
                          
                      
                              
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                
                                child: Text("project retrospective", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                          
                            
                        ],
                      ),
        
        
        
        
        
        
                ),/////#4
                SizedBox(height: 20),

        
            ],
            
          ),
         
        ),
        
        
            ),
             Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                    
                    },
                  ),
                ),
              )
      
        ],
      ),

    );
  }
}