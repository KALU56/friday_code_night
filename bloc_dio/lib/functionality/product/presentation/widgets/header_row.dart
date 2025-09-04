import 'package:flutter/material.dart';

class HeaderRow extends StatefulWidget {
  final String userName;

  const HeaderRow({this.userName = "Kali", Key? key}) : super(key: key);

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
  
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/product.png'),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.blue),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 16),

        TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
           
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        )
      ],
    );
  }
}
