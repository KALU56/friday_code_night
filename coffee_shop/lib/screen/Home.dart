import 'package:flutter/material.dart';
import '../components/bootom_nav.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                    _buildCoffeeChip("Cappuccino"),
                    _buildCoffeeChip("Ethiopian Coffee"),
                    _buildCoffeeChip("Arab Coffee"),
                    _buildCoffeeChip("Macchiato"),
                    _buildCoffeeChip("Latte"),
                    _buildCoffeeChip("Turkish Coffee"),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            SizedBox(height: 20),
   

          ],
          
        ),
        )
        
      ),
  
    );
  }
}

  Widget _buildCoffeeChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.brown[100],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
