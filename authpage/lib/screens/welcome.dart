import 'package:flutter/material.dart';
import '../core/assets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: 480,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.sofa1Image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'The Best',
                      style: TextStyle(
                        color: Color.fromARGB(255, 19, 17, 17),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Furniture For Home',
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 7, 7),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Introducing our furniture marketplace mobile app, featuring a stunning splash screen followed by a user-friendly homepage showcasing a wide array of products and promotions',
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 7, 7),
                        fontSize: 12,
                       
                      ),
                    ),
                    const SizedBox(height: 45),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 11, 172, 118),
                          foregroundColor: const Color.fromARGB(255, 250, 249, 249), 
                             minimumSize: const Size(double.infinity, 50), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), 
                            ),
                                  
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
