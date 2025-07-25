// lib/widgets/product_item.dart
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final IconData? icon;
  final String? label;

  const ProductItem({super.key, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
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
                          label!,
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
}
