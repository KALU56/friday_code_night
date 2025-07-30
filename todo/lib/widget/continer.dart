import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int count;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.title,
    required this.icon,
    required this.count,
    this.backgroundColor = const Color.fromARGB(255, 136, 205, 245),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(count.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
