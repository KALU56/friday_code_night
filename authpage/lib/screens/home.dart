import 'package:flutter/material.dart';
import '../core/assets.dart';


class Product {
  final String name;
  final String price;
  final String imagePath;

  Product({required this.name, required this.price, required this.imagePath});
}


final List<Product> products = [
  Product(name: 'Sofa', price: 'ETB 500', imagePath: Assets.product1),
  Product(name: 'Sofa', price: 'ETB 750', imagePath: Assets.product2),
  Product(name: 'Sofa', price: 'ETB 600', imagePath: Assets.product3),
];
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
    SingleChildScrollView(
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
                    fontWeight: FontWeight.w900,
                    color: Colors.black, 
                  ),
                ),
               
                Text(
                  'Dream Furniture',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w900,
                    color: Colors.black, 
                  
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
          SizedBox(height: 15),
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
                              fontSize: 20,
                           
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            
                            ),),
                    
                  Text("until july 24",  style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                           
                            ),),
                            SizedBox(height: 10,),
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


    )
    ),);
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
class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,                             
      physics: const NeverScrollableScrollPhysics(), 
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,         
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.99,     
      ),
      itemBuilder: (context, index) {
        return ProductCard(products: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product products;

  const ProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                products.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              products.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              products.price,
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
