import 'package:flutter/material.dart';

import 'package:intl/intl.dart'; 


class TasklistModel {
  final String title;
  final DateTime day;
  final IconData icon;
  final TimeOfDay time;
  final ImageProvider image;
  final Color backgroundColor;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  TasklistModel({
    required this.title,
    required this.day,
    required this.icon,
    required this.time,
    required this.image,
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
    this.onEdit,
    this.onDelete,
  });
}
  
