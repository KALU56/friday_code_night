import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatefulWidget {
  final String title;
  final DateTime day;
  final IconData icon;
  final TimeOfDay time;
  final Color backgroundColor;
  final ImageProvider image;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TaskList({
    super.key,
    required this.title,
    required this.icon,
    required this.day,
    required this.time,
    required this.image,
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
    this.onEdit,
    this.onDelete,
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
            checkColor: Colors.black,
            activeColor: Colors.white,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: const Color.fromRGBO(185, 188, 194, 1),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.day.day}/${widget.day.month}/${widget.day.year}",
                      style: const TextStyle(
                        color: Color.fromRGBO(185, 188, 194, 1),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(widget.icon, 
                         color: Color.fromRGBO(185, 188, 194, 1),
                         size: 16),
                    const SizedBox(width: 2),
                    Text(
                      _formatTimeOfDay(widget.time),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(185, 188, 194, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(image: widget.image),
              ),
            ),
            onSelected: (value) {
              if (value == 'edit' && widget.onEdit != null) {
                widget.onEdit!();
              } else if (value == 'delete' && widget.onDelete != null) {
                widget.onDelete!();
              }
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
  
  String _formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat.jm().format(dt);
  }
}