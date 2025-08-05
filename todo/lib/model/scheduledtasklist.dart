import 'package:flutter/material.dart';


class ScheduledtasklistModel {
  final String title;
  final DateTime day;
  final IconData icon;
  final TimeOfDay time;
  final Color backgroundColor;
  final ImageProvider image;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  ScheduledtasklistModel({
    required this.title,
    required this.icon,
    required this.day,
    required this.time,
    required this.image,
    // required this.onChecked,
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
    this.onEdit, 
     this.onDelete,
  });
}

  
