import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imagePath;

  Product({required this.name, required this.price, required this.imagePath});
}


final List<Product> products = [
  Product(name: 'COFFEE', price: 'ETB 500', imagePath: 'assets/images/coffee1.webp'),
  Product(name: 'COFFEES', price: 'ETB 750', imagePath: 'assets/images/coffee2.webp'),
  Product(name: 'COFFEE', price: 'ETB 600', imagePath: 'assets/images/coffee3.webp'),
];
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(235, 31, 0, 0), 
          child: Column(
     
          
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Color.fromARGB(255, 247, 244, 244)),
                  onPressed: () {
                    
                  },
                ),
          
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 233, 230, 230)),
                  onPressed: () {
                    
                  },
                ),
              ],

            ),
            Text('Find Your Best Coffee',
              style: TextStyle(
                color: const Color.fromARGB(255, 241, 237, 237),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Discover the best coffee in town',
              style: TextStyle(
                color: const Color.fromARGB(255, 230, 223, 223),
                fontSize: 22,
              ),
            ),
            
            SizedBox(height: 20),

                  Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Coffee',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.brown[50], 
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    coffee("Cappuccino"),
                    coffee("Ethiopian Coffee"),
                    coffee("Arab Coffee"),
                    coffee("Macchiato"),
                    coffee("Latte"),
                    coffee("Turkish Coffee"),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Container(
              child:ProductList(),),
            
             

          ],
          
        ),
        )
        
      ),
  
    );
  }
}class ProductList extends StatelessWidget {
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
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

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
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.price,
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
  Widget coffee(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.brown[100],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
