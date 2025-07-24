import 'package:flutter/material.dart';
import '../core/assets.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     Text(
                  'Find Your',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w700,
                    color: Colors.black, 
                  ),
                ),
               
                Text(
                  'Dream Furniture',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w700,
                    color: Colors.black, 
                    letterSpacing: 1.2, 
                  ),
                ),
                ],
              ),
               IconButton(
                  icon: const Icon(Icons.search, color: Color.fromARGB(255, 100, 97, 97)),
                  onPressed: () {
                    
                  },
                ),


            ],
          ),
          Container(
             padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 179, 177, 177),
                  borderRadius: BorderRadius.circular(12),
                ),
              height: 150,
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 15,),
                       Text("30% off",  style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),),
                    
                  Text("until july 24",  style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),),
                            SizedBox(height: 15,),
                   ElevatedButton(
                        onPressed: () {
                         
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 11, 172, 118),
                          foregroundColor: const Color.fromARGB(255, 250, 249, 249), 
                            
                           
                                  
                        ),
                        
                        child: const Text('Get Now'),
                      ),

                  ]
               

                ),
                 SizedBox(width: 10),
                     Container(
          
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.sofa1Image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 55),
              ],

            )
          
          ),
      
      const SizedBox(height: 24),
                

                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                      children: [
                         const SizedBox(width: 12),
                          product(label: "All"),         
                          product(icon: Icons.chair),
                          product(icon: Icons.weekend),
                          product(icon: Icons.light),
                          product(icon: Icons.table_restaurant),
                          product(icon: Icons.bed),
                          product(icon: Icons.checkroom),
                          const SizedBox(width: 16),
                ],
                            ),
              ),
                
                    
                Align(
            alignment: Alignment.centerLeft, 
            child: Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          )

        ],




      ),
      ),


    ));
  }
}
Widget product({IconData? icon, String? label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: icon != null
              ? IconButton(
                  icon: Icon(icon, size: 30, color: const Color.fromARGB(255, 11, 172, 118)),
                  onPressed: () {},
                )
              : label != null
                  ? Center(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 11, 172, 118),
                        ),
                      ),
                    )
                  : null,
        ),
        const SizedBox(height: 4),
      ],
    ),
  );
}
