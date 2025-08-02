import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final String title;
  final DateTime day;
  final IconData icon;
  final TimeOfDay time;
  final Color backgroundColor;
  final ImageProvider image;
  // final Function(int index) onChecked;

  const TaskList({
    super.key,
    required this.title,
    required this.icon,
    required this.day,
    required this.time,
    required this.image,
    // required this.onChecked,
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
                // widget.onChecked;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),

                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: const Color.fromRGBO(185, 188, 194, 1),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.day.day}/${widget.day.month}/${widget.day.year}",
                      style: const TextStyle(
                        color: Color.fromRGBO(185, 188, 194, 1),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(widget.icon, color: Color.fromRGBO(185, 188, 194, 1)),
                    const SizedBox(width: 8),
                    Text(
                      widget.time.format(context),
                      style: const TextStyle(
                        color: Color.fromRGBO(185, 188, 194, 1),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          Spacer(),

     Spacer(),

          PopupMenuButton<String>(
            icon: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(image: widget.image),
              ),
            ),
            onSelected: (value) {
        
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 18),
                    SizedBox(width: 8),
                    Text('Edit'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 18),
                    SizedBox(width: 8),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
